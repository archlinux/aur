# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>
# Contributor: Samuel Walladge <samuel at swalladge dot net>

pkgname=tagspaces-bin
_pkgname=tagspaces
pkgver=5.3.2
pkgrel=1
pkgdesc="TagSpaces is an open source personal data manager. It helps you organize files with tags on every platform."
arch=("x86_64")
url="http://tagspaces.org"
license=("AGPL")
provides=("tagspaces")
conflicts=("tagspaces")
sha256sums=('59c89cb9496f7ab7818d50d9e235a45a8d3f6e0f792c109ca6529d6f0c242a9b')
source=("${_pkgname}-${pkgver}.deb::https://github.com/${_pkgname}/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-linux-amd64-${pkgver}.deb")

package() {
  bsdtar -xv -C "${pkgdir}" -f "${srcdir}/data.tar.xz"

  # symlink the main binary to a better location
  mkdir -p ${pkgdir}/usr/bin/
  ln -s /opt/TagSpaces/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
}
