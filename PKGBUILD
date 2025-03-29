# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>

pkgname=mkinitcpio-encrypt-detached-header
pkgver=1.0.1
pkgrel=1
pkgdesc="cryptsetup's initcpio encrypt hook with support for detached header FS#42851"
arch=('any')
license=('GPL')
makedepends=('cryptsetup')
source=('support-detached-header.patch')
sha256sums=('a880da9ac283f7d13d0cb1a175a6b26c517d4cfcb819cffbe181375328f80b76')

build() {
    cp /usr/lib/initcpio/install/encrypt install-encrypt-dh
    patch -Np1 /usr/lib/initcpio/hooks/encrypt support-detached-header.patch -o hooks-encrypt-dh
}

package() {
    install -Dm644 install-encrypt-dh "$pkgdir/usr/lib/initcpio/install/encrypt-dh"
    install -Dm644 hooks-encrypt-dh "$pkgdir/usr/lib/initcpio/hooks/encrypt-dh"
}

# vim:set ts=4 sw=4 et:
