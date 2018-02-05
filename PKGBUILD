# Maintainer: Denis Kasak <dkasak|AT|termina.org.uk>

pkgname=desk-git
pkgver=v0.6.0.r10.g20369d7
pkgrel=1
pkgdesc="A lightweight workspace manager for the shell"
arch=('any')
url="https://github.com/jamesob/desk"
license=('MIT')
depends=('bash')
makedepends=('git')
source=("$pkgname::git+https://github.com/jamesob/desk")

sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname" || exit
    git describe --long --tags | \
      sed 's|^releases/||;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -m755 "$srcdir/$pkgname/desk" "$pkgdir/usr/bin/desk"
}

# vim:set ts=4 sts=4 sw=4 et:
