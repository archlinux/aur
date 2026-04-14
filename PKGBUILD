# Maintainer: Emma CHRISTOPHE <jean.michel.lesatanique@gmail.com>
pkgname=crcl-select
pkgver=1.0
pkgrel=1
pkgdesc="Circle selection utility with Eww widgets"
arch=('x86_64')
url=""
license=('unknown')
groups=()
depends=('eww')
makedepends=('jansson')
source=('https://github.com/Pat8998/crcl-select/releases/download/1.0/crcl-sl.tar')
sha256sums=(fea8f6944d58078b667465076c6285d16b385541549613e88bf8d7733017f1cf)

build() {
	ls
	gcc "eww-circle.c"    		-O3 -o cr-circle-gen   -ljansson -lm
	gcc "eww-execute.c"   		-O3 -o cr-exe          -ljansson -lm
	gcc "eww-angle.c"     		-O3 -o cr-angle        -ljansson -lm
	gcc "eww-circle-select.c" 	-O3 -o c-select    	   -ljansson -lm
}

package() {
	# Create the target directory
	mkdir -p "$pkgdir"/"${HOME#/}"/.config/crcl-select
	
	# Copy compiled binaries
	install -Dm755 "cr-circle-gen" "$pkgdir"/"${HOME#/}"/.config/crcl-select/
	install -Dm755 "cr-exe" "$pkgdir"/"${HOME#/}"/.config/crcl-select/
	install -Dm755 "cr-angle" "$pkgdir"/"${HOME#/}"/.config/crcl-select/
	install -Dm755 "c-select" "$pkgdir"/"${HOME#/}"/.config/crcl-select/
	
	# Copy data files
	install -Dm644 "eww.yuck" "$pkgdir"/"${HOME#/}"/.config/crcl-select/
	install -Dm644 "eww.scss" "$pkgdir"/"${HOME#/}"/.config/crcl-select/
	install -Dm644 "toolbox.json" "$pkgdir"/"${HOME#/}"/.config/crcl-select/
}
