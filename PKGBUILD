# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Erich Eckner <deep42thought@archlinux32.org>
pkgname=archlinux32-keyring
pkgver=20220209
pkgrel=1.0
pkgdesc='Arch Linux 32 PGP keyring'
arch=('any')
url='https://archlinux32.org'
license=('GPL')
install=$pkgname.install
conflicts=(archlinux32-keyring-transition)
replaces=(archlinux32-keyring-transition)
source=("https://sources.archlinux32.org/sources/${pkgname}-v${pkgver}.tar.gz"{,.sig})
sha512sums=('d7e44cc2218381edb7dbfbfee887965a3401bc56934a1d0327fdfbeffd32dc7132176e7b197d561b7e4446a6d83284404429fb4bb3e1dc1ea9a21b8e47e71bee'
            'SKIP')
validpgpkeys=('DE9F7688CACF04FEB81A6C590AEEC90755DA7B5A')

package() {
    cd ${pkgname}-v${pkgver}
    make PREFIX=/usr DESTDIR="${pkgdir}" install
}
