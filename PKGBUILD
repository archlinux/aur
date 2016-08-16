# Maintainer: Nikita Ignatovich <nikita@ignatovich.me>
# Contributor: Nikita Ignatovich <nikita@ignatovich.me>
# Based on package veracrypt-hook 5.1-2
pkgname=veracrypt-hook-nonroot
pkgver=1.0
pkgrel=2
pkgdesc="Extensive hook for operations on a veracrypt encrypted non root devices"
arch=(any)
url="https://veracrypt.codeplex.com/"
license=('GPL')
depends=(mkinitcpio veracrypt)
conflicts=('veracrypt-hook')
install=${pkgname}.install
source=(veracrypt_hook_nonroot veracrypt_install)
sha512sums=('fc36ea94a02e801141a41a9063385f17a84c5d1ad44dbb1567cad77ae31bb431ba36c88bfb86d80f87a185f48fd24140a636be117967a279673ee879a286be34'
            'a1e3a7af939cabd928b0aafebc6718d687693118ea59ab21f4c160c8449e5e52872674af42511d32884f288ba76fa3b2da1ac98df77ad64e01a629bd63d3eaf5')

package() {
    install -o root -g root -D ${srcdir}/veracrypt_hook_nonroot ${pkgdir}/usr/lib/initcpio/hooks/veracrypt
    install -o root -g root -D ${srcdir}/veracrypt_install ${pkgdir}/usr/lib/initcpio/install/veracrypt
}

