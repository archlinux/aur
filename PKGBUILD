# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Erich Eckner <deep42thought@archlinux32.org>
pkgname=archlinux32-keyring
pkgver=20240131
pkgrel=1.0
pkgdesc='Arch Linux 32 PGP keyring'
arch=('any')
url='https://archlinux32.org'
license=('GPL')
install=$pkgname.install
conflicts=(archlinux32-keyring-transition)
replaces=(archlinux32-keyring-transition)
source=("https://sources.archlinux32.org/sources/${pkgname}-v${pkgver}.tar.gz"{,.sig})
sha512sums=('c03f66d94d4337303b01d6ca4c2c94577aa4a0d3d8e5cfcd1c8a4d6a4db324d1de2aeb8156a60ae8726b7ca3fd2af6753a3eec95b771bc043e32e08d56f5b6e6'
            'SKIP')
validpgpkeys=('DE9F7688CACF04FEB81A6C590AEEC90755DA7B5A')

package() {
    cd ${pkgname}-v${pkgver}
    make PREFIX=/usr DESTDIR="${pkgdir}" install
}
