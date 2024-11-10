# Maintainer: didi2002 <didi2002 at mailbox . org>
_pkgbase=r8126
pkgname=r8126-dkms
pkgver=10.014.01
pkgrel=1
pkgdesc="Kernel module for Realtek RTL8126"
arch=('x86_64')
url='https://www.realtek.com/Download/List?cate_id=584'
license=('GPL2')
depends=('dkms')
optdepends=('linux-headers: Build the module for Arch kernel'
            'linux-lts-headers: Build the module for LTS Arch kernel')
conflicts=("${_pkgbase}")
source=("https://github.com/openwrt/rtl8126/releases/download/${pkgver}/${_pkgbase}-${pkgver}.tar.bz2"
        "dkms.conf")
sha256sums=('dbb10a7abd0972e4abd1b89ea4eb22fc55d6c1dc2f711b5acf4a3bc376275e21'
            '936bd24befc34fd6f9d5742f301a0b87bc18340223958fbe2676fc5c061eaa81')
package() {
  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i dkms.conf

  install -d "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
  install -Dm644 dkms.conf "${_pkgbase}-${pkgver}"/src/* "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/"
}
