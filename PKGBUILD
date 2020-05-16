# Maintainer: 
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Kowalczyk Patryk <patryk AT kowalczyk DOT ws>
# Contributor: <John freehaha  at gmail  dot com> - patch paragon-ufsd-3.10_v01.patch
# Contributor: Pradeep Murthy <pradeepmur (at) gmail> (dkms wrapper)

pkgname=ufsd-module-dkms
_pkgname=ufsd-module
pkgver=9.6.7
_srcdir=Paragon-715-FRE_NTFS_Linux_${pkgver}_Express
pkgrel=1
pkgdesc='Paragon NTFS & HFS for Linux driver. - ACLs removed. DKMS version'
arch=('i686' 'x86_64')
url='http://paragon-software.com/'
license=('custom')
depends=('dkms' 'linux-lts')
makedepends=('linux-lts-headers')
install=ufsd-module-dkms.install

source=("https://dl.paragon-software.com/free/Paragon-715-FRE_NTFS_Linux_${pkgver}_Express.tar.gz"
        "dkms.conf"
)

sha256sums=('bb2bd93f12b08f1e003960c45057fa9d6b2302bb40abb15b1af6767c1479a776'
            'ccbfd0311238835fe3eff647f0196046a1557187da75f81c3ef9935c39229e13')


package() {
  install -dm755 ${pkgdir}/usr/src/${_pkgname}-${pkgver}
  sed "s/%pkgver%/$pkgver/" dkms.conf > ${pkgdir}/usr/src/${_pkgname}-${pkgver}/dkms.conf
  cp -RL ${srcdir}/* ${pkgdir}/usr/src/${_pkgname}-${pkgver}
}
