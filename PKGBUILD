# Maintainer: Samuel Walladge <samuel at swalladge dot id dot au>

pkgname=tagspaces-bin
_pkgname=tagspaces
pkgver=3.2.3
pkgrel=1
pkgdesc="TagSpaces is an open source personal data manager. It helps you organize files with tags on every platform."
arch=("x86_64")
url="http://tagspaces.org"
license=("AGPL")
provides=("tagspaces")
conflicts=("tagspaces")
sha256sums=('643f6a67cd6f5a44fd86091d7d3e4bc8060b4dd8b3a87adef314722d0ce92b24')
source=("${_pkgname}-${pkgver}.deb::https://github.com/${_pkgname}/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-linux-amd64-${pkgver}.deb")

package() {
  bsdtar -xv -C "${pkgdir}" -f "${srcdir}/data.tar.xz"

  # symlink the main binary to a better location
  mkdir -p ${pkgdir}/usr/bin/
  ln -s /opt/TagSpaces/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
}
