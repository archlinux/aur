# Maintainer: Hans-Nikolai Viessmann <hv15 AT hw.ac.uk>
pkgname=startw
pkgver=1.1.1
_commit=384dd0b92bb7c7b8b833f4ac6b4bb1e3f6019747
pkgrel=3
pkgdesc="Script to initialise a Wayland session - similar to startx"
arch=('any')
url="https://git.hans.ninja/hans/startw"
license=('MIT')
optdepends=('sway: A Tiling Wayland shell based on i3')
source=("$pkgname-$pkgver.tar.gz::https://git.hans.ninja/hans/${pkgname}/repository/${pkgver}/archive.tar.gz")
md5sums=('634c60aa1e6b265757ce041c6648abd2')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}-${_commit}"

    mkdir -p $pkgdir/usr/share/man/man1
    install -D -m644 ./man/startw.1 $pkgdir/usr/share/man/man1/startw.1

    mkdir -p $pkgdir/usr/share/doc/$pkgname
	install -D -m644 ./example.conf/winitrc $pkgdir/usr/share/doc/$pkgname/winitrc.example

    mkdir -p $pkgdir/usr/bin
    install -D -m755 ./startw $pkgdir/usr/bin/startw
}
