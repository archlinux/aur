# Maintainer: Erich Eckner <deep42thought@archlinux32.org>
pkgname=archlinux32-keyring
pkgver='20200408'
pkgrel='1.0'
pkgdesc='Arch Linux 32 PGP keyring'
arch=('any')
url='https://archlinux32.org'
license=('GPL')
install="${pkgname}.install"
conflicts=('archlinux32-keyring-transition')
replaces=('archlinux32-keyring-transition')
source=("https://sources.archlinux32.org/sources/${pkgname}-v${pkgver}.tar.gz"{,.sig})
sha512sums=('09082e90f6f33ed0fdf96646b3c26aee9cb5d97f6d1ecddba58f58c22ca357bd64fa77c277cd0f43af2e244372e6ecbaa9ec760f805a925c75de993ad85127dd'
            'SKIP')
validpgpkeys=('DE9F7688CACF04FEB81A6C590AEEC90755DA7B5A')

package() {
    cd "${srcdir}/${pkgname}-v${pkgver}"
    make PREFIX=/usr DESTDIR=${pkgdir} install
}
