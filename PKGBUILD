# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Erich Eckner <deep42thought@archlinux32.org>
pkgname=archlinux32-keyring
pkgver=20231126
pkgrel=1.0
pkgdesc='Arch Linux 32 PGP keyring'
arch=('any')
url='https://archlinux32.org'
license=('GPL')
install=$pkgname.install
conflicts=(archlinux32-keyring-transition)
replaces=(archlinux32-keyring-transition)
source=("https://sources.archlinux32.org/sources/${pkgname}-v${pkgver}.tar.gz"{,.sig})
sha512sums=('17e0eb2eb4a7f3f4babec86389feb26d7a70c05ab465e1001d849ade9761bcbb90b3ede7a5a744ef4c760e80b8805a7ec6f6a1d7c75cd71332c76486ab1853e2'
            'SKIP')
validpgpkeys=('DE9F7688CACF04FEB81A6C590AEEC90755DA7B5A')

package() {
    cd ${pkgname}-v${pkgver}
    make PREFIX=/usr DESTDIR="${pkgdir}" install
}
