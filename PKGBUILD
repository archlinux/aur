#Maintainer: Julius Schumacher <juliusschumacher at gmail dot com>
pkgname=eterm8
pkgver=0.971
pkgrel=1
pkgdesc="IDE for assembly language programming"
arch=('x86_64')
url="http://www.cse.chalmers.se/edu/resources/software/index.html"
license=('Copyright 1989-2018, GMV')

#depends=()
makedepends=('libarchive')

source=(http://www.cse.chalmers.se/edu/resources/software/linux/$pkgname\_$pkgver\_amd64.deb)
md5sums=('8c221226979285dd40d456e87c43ee3e')
sha256sums=('63362419ffde2cce716925a373c66dc113f4e46da9fa64b821742d23bd8a42f4')

prepare() {
	msg2 "Unpacking .deb"
	cd $srcdir
	bsdtar -xf data.tar.xz
}

package() {
	msg2 "Moving stuff in place"
	install -Dm755 "$srcdir/usr/share/eterm8/arm-none-eabi-as" \
					"$pkgdir/usr/share/eterm8/arm-none-eabi-as"

	install -Dm755 "$srcdir/usr/share/eterm8/arm-none-eabi-gdb" \
					"$pkgdir/usr/share/eterm8/arm-none-eabi-gdb"

	install -Dm755 "$srcdir/usr/share/eterm8/arm-none-eabi-ld" \
					"$pkgdir/usr/share/eterm8/arm-none-eabi-ld"

	install -Dm755 "$srcdir/usr/share/eterm8/arm-none-eabi-objcopy" \
					"$pkgdir/usr/share/eterm8/arm-none-eabi-objcopy"

	install -Dm755 "$srcdir/usr/share/eterm8/arm-none-eabi-objdump" \
					"$pkgdir/usr/share/eterm8/arm-none-eabi-objdump"

	install -Dm755 "$srcdir/usr/share/eterm8/eterm8" \
					"$pkgdir/usr/share/eterm8/eterm8"

	install -Dm755 "$srcdir/usr/share/eterm8/eterm8.png" \
					"$pkgdir/usr/share/eterm8/eterm8.png"

	install -Dm755 "$srcdir/usr/share/eterm8/md407-ram.x" \
					"$pkgdir/usr/share/eterm8/md407-ram.x"

	install -Dm755 "$srcdir/usr/share/eterm8/simserver" \
					"$pkgdir/usr/share/eterm8/simserver"

	install -Dm755 "$srcdir/usr/share/eterm8/simserver.png" \
					"$pkgdir/usr/share/eterm8/simserver.png"

	install -Dm644 "$srcdir/usr/share/applications/eterm8.desktop" \
					"$pkgdir/usr/share/applications/eterm8.desktop"

	install -Dm644 "$srcdir/usr/share/applications/gdbarm.desktop" \
					"$pkgdir/usr/share/applications/gdbarm.desktop"

	install -Dm644 "$srcdir/usr/share/applications/simserver.desktop" \
					"$pkgdir/usr/share/applications/simserver.desktop"

	install -Dm644 "$srcdir/usr/share/doc/eterm8/changelog.gz" \
					"$pkgdir/usr/share/doc/eterm8/changelog.gz"

	install -Dm644 "$srcdir/usr/share/doc/eterm8/copyright" \
					"$pkgdir/usr/share/doc/eterm8/copyright"

	msg2 "Creating symlinks"
	mkdir -p "$pkgdir/usr/bin"
	ln -s "/usr/share/eterm8/eterm8" "$pkgdir/usr/bin/eterm8"
	ln -s "/usr/share/eterm8/simserver" "$pkgdir/usr/bin/simserver"
	ln -s "/usr/share/eterm8/gdbarm" "$pkgdir/usr/bin/gdbarm"
}

