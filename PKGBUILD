# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Erich Eckner <deep42thought@archlinux32.org>
pkgname=archlinux32-keyring
pkgver=20250630
pkgrel=1.0
pkgdesc='Arch Linux 32 PGP keyring'
arch=('any')
url='https://archlinux32.org'
license=('GPL')
install=$pkgname.install
conflicts=(archlinux32-keyring-transition)
replaces=(archlinux32-keyring-transition)
source=("https://sources.archlinux32.org/sources/${pkgname}-v${pkgver}.tar.gz"{,.sig})
sha512sums=('1a6a213aba8a90625a90999eb4ab2b5144fb4ab8b7ec8faaf7a0b7ffb2bc9bbc540c28a6cb955ecc0db134e5735017e481fb6ad16aebf94392ef4694a3eb8137'
            'SKIP')
validpgpkeys=('DE9F7688CACF04FEB81A6C590AEEC90755DA7B5A')

package() {
    cd ${pkgname}-v${pkgver}
    make PREFIX=/usr DESTDIR="${pkgdir}" install
}
