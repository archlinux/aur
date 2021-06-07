# Maintainer: yjun <jerrysteve1101 at gmail dot com>


pkgname=apipost-bin
_pkgname=${pkgname%-bin}
pkgver=5.2.5
pkgrel=1
pkgdesc="An API debugging and management tool that supports team collaboration and can generate documents directly."
arch=('x86_64')
url="https://www.apipost.cn/"
license=('custom')
depends=('gtk3' 'nss' 'libxss')
makedepends=('tar')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}-${pkgver}.deb::https://www.apipost.cn/dl.php?client=Linux&arch=x64")
sha256sums=('9031753589dda5ea645f34ed5892713b65e9b16f3174cedb5d6af8958274beb4')

package() {
  tar -xf data.tar.xz -C ${pkgdir}
  
  mv ${pkgdir}/opt/ApiPost ${pkgdir}/opt/${_pkgname}

  install -dm755 ${pkgdir}/usr/bin/
  ln -sf /opt/${_pkgname}/${_pkgname}  ${pkgdir}/usr/bin/${_pkgname}
}
# vim: set sw=2 ts=2 et:
