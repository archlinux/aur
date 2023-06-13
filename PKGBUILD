# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Samuel Walladge <aur @ swalladge dot net>
# Contributor: Asger Weirsøe <asger@weirsoe.dk>
# Contributer: Alex Garcia <thekyz@gmail.com>

pkgname=jobber-bin
_pkgname=jobber
pkgver=1.4.4
pkgrel=2
pkgdesc="An alternative to cron, with sophisticated status-reporting and error-handling"
provides=('jobber')
conflicts=('jobber')
arch=('x86_64')
url='https://dshearer.github.io/jobber/'
license=('MIT')
sha256sums=('eb4f50c0d2510480bafa3efc5711fe750685c0534cfbbc74aa479a0dfdba6698')
source=("https://github.com/dshearer/jobber/releases/download/v$pkgver/$_pkgname-$pkgver-1.el8.$arch.rpm")

build() {
    cd $srcdir
    bsdtar -xf ./$_pkgname-$pkgver-1.el8.$arch.rpm
}

package() {
    mkdir -p $pkgdir/usr/local
    mkdir -p $pkgdir/usr/bin

    mv $srcdir/usr/lib $pkgdir/usr/lib
    mv $srcdir/usr/local/bin/jobber $pkgdir/usr/bin/
    mv $srcdir/usr/local/libexec/ $pkgdir/usr/local
}
