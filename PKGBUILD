# Maintainer: lestb <tkhdlstfl dot l plus aur at gmail dot com>
# Contributor: Ivan Petruk <localizator@ukr.net>

pkgname=pcloud
pkgver=3.0.1
pkgrel=1
pkgdesc="pCloud Drive client"
arch=('x86_64')
url="http://pcloud.com"
license=('unknown')
makedepends=('tar')
conflicts=('pcloud-git')
replaces=('pcloud-git')
source="https://c123.pcloud.com/dHZh5k68ZBCBEYZZZzKCXl7ZHkZZ3RXZkZWxIkZO59cFKyp4UJjjTM3CDGI0LhhOkkV/pCloud_Linux_amd64_3.0.1.deb"
sha256sums=('5c6a52a8d1d1e6e13ba6d5086ca4a775ce82a81c1e7bdd3f1b12c1f4aa4476fe')

prepare() {
  cd "${srcdir}"
  tar -zxf data.tar.gz
}

package() {
  cd "${srcdir}"
  install -Dm755 usr/bin/psyncgui "${pkgdir}/usr/bin/psyncgui"
  install -Dm644 usr/share/doc/pclsync/copyright "${pkgdir}/usr/share/doc/pclsync/copyright"
  install -Dm644 usr/share/applications/pclsync.desktop "${pkgdir}/usr/share/applications/pclsync.desktop"
  install -Dm644 usr/share/menu/pclsync "${pkgdir}/usr/share/menu/pclsync"
  install -Dm644 usr/share/pixmaps/pcloud-icon.svg "${pkgdir}/usr/share/pixmaps/pcloud-icon.svg"
}
