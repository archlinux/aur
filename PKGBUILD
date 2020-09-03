# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>

pkgname=mkinitcpio-encrypt-detached-header
pkgver=1.0.0
pkgrel=1
pkgdesc="cryptsetup's initcpio encrypt hook with support for detached header FS#45851"
arch=('any')
license=('GPL')
makedepends=('cryptsetup')
source=('support-detached-header.patch')
sha256sums=('52012bd402eae8b46c3368711d790643581fdfad27eae3bb894e1cc407a6ce15')

build() {
    cp /usr/lib/initcpio/install/encrypt install-encrypt-dh
    patch -Np1 /usr/lib/initcpio/hooks/encrypt support-detached-header.patch -o hooks-encrypt-dh
}

package() {
    install -Dm644 install-encrypt-dh "$pkgdir/usr/lib/initcpio/install/encrypt-dh"
    install -Dm644 hooks-encrypt-dh   "$pkgdir/usr/lib/initcpio/hooks/encrypt-dh"
}

# vim:set ts=4 sw=4 et:
