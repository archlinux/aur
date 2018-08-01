# Maintainer: Hans-Nikolai Viessmann <hans @ viess.mn>
pkgname=startw
pkgver=1.1.1
pkgrel=4
pkgdesc="Script to initialise a Wayland session - similar to startx"
arch=('x86_64')
url="https://github.com/hv15/startw"
license=('MIT')
optdepends=('sway: A Tiling Wayland shell based on i3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hv15/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('af87d7120b31e7a65a6789dfda84afeb')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

    mkdir -p $pkgdir/usr/share/man/man1
    install -D -m644 ./man/startw.1 $pkgdir/usr/share/man/man1/startw.1

    mkdir -p $pkgdir/usr/share/doc/$pkgname
	install -D -m644 ./example.conf/winitrc $pkgdir/usr/share/doc/$pkgname/winitrc.example

    mkdir -p $pkgdir/usr/bin
    install -D -m755 ./startw $pkgdir/usr/bin/startw
}
