# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Erich Eckner <deep42thought@archlinux32.org>
pkgname=archlinux32-keyring
pkgver=20210429
pkgrel=1.0
pkgdesc='Arch Linux 32 PGP keyring'
arch=('any')
url='https://archlinux32.org'
license=('GPL')
install=$pkgname.install
conflicts=(archlinux32-keyring-transition)
replaces=(archlinux32-keyring-transition)
source=("https://sources.archlinux32.org/sources/${pkgname}-v${pkgver}.tar.gz"{,.sig})
sha512sums=('57704496ced0fcccb16e9bb1fb54524387f98cac67e84a8080a8bf540e802e9763bc27c29f5f2e50a8f74e4965a47cf43032e8b15ee86f21a1733e1a588a9c65'
            'SKIP')
validpgpkeys=('DE9F7688CACF04FEB81A6C590AEEC90755DA7B5A')

package() {
    cd ${pkgname}-v${pkgver}
    make PREFIX=/usr DESTDIR="${pkgdir}" install
}
