# Maintainer: Hans-Nikolai Viessmann <hv15 AT hw.ac.uk>
pkgname=startw
pkgver=1.1.1
pkgrel=2
pkgdesc="Script to initialise a Wayland session - similar to startx"
arch=('any')
url="https://git.hans.ninja/hans/startw"
license=('MIT')
optdepends=('sway: A Tiling Wayland shell based on i3')
source=("$pkgname-$pkgver.tar.gz::https://git.hans.ninja/hans/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('f0e214e410240cd56d3ccb87bdc8cff7')

package() {
	cd "$srcdir"

    mkdir -p $pkgdir/usr/share/man/man1
    install -D -m644 ./man/startw.1 $pkgdir/usr/share/man/man1/startw.1

    mkdir -p $pkgdir/usr/share/doc/$pkgname
	install -D -m644 ./example.conf/winitrc $pkgdir/usr/share/doc/$pkgname/winitrc.example

    mkdir -p $pkgdir/usr/bin
    install -D -m755 ./startw $pkgdir/usr/bin/startw
}
