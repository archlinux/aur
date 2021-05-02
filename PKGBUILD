# Maintainer: Erich Eckner <deep42thought@archlinux32.org>
pkgname=archlinux32-keyring
pkgver='20210331'
pkgrel='1.0'
pkgdesc='Arch Linux 32 PGP keyring'
arch=('any')
url='https://archlinux32.org'
license=('GPL')
install="${pkgname}.install"
conflicts=('archlinux32-keyring-transition')
replaces=('archlinux32-keyring-transition')
source=("https://sources.archlinux32.org/sources/${pkgname}-v${pkgver}.tar.gz"{,.sig})
sha512sums=('a29345e5ecb9fd14f2afc43dfdc5190c7c84d94a29e3487d6541c0cfcb52a71b3935382939fce7fcf5241437846793b0e9c21ce52fb3f26f508a5e6e2d51518c'
            'SKIP')
validpgpkeys=('DE9F7688CACF04FEB81A6C590AEEC90755DA7B5A')

package() {
    cd "${srcdir}/${pkgname}-v${pkgver}"
    make PREFIX=/usr DESTDIR=${pkgdir} install
}
