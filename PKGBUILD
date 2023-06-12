pkgname=uniciv-bin
pkgver=4.7.0
pkgrel=1
pkgdesc="Uniciv bin"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
url="https://github.com/yairm210/Unciv"
options=()
license=("MPL 2.0")
source=(
	"${pkgname}-${pkgver}.jar::https://github.com/yairm210/Unciv/releases/download/${pkgver}/Unciv.jar"
	"uniciv::https://pastebin.com/raw/YYcHRv48"
)
sha256sums=(
	'02c8ce461f0b62221028aa747773be8d6607c620201aa7cae075e6c894dee306'
	'90697f0f9e48b4d3f8b5e636731af870a091582195ba84c0d8a2a3360564b606'
)

build() {
	sed -i -e 's/\r$//' uniciv
}

package() {
	cd "$srcdir"
	mkdir -p $pkgdir/usr/lib/uniciv
	cp ${pkgname}-${pkgver}.jar $pkgdir/usr/lib/uniciv/uniciv.jar
	mkdir -p $pkgdir/usr/bin
	cp uniciv $pkgdir/usr/bin/uniciv
	chmod +x $pkgdir/usr/bin/uniciv
}
