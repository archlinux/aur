# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>
# Contributor: Samuel Walladge <samuel at swalladge dot net>

pkgname=tagspaces-bin
_pkgname=tagspaces
pkgver=4.4.2
pkgrel=1
pkgdesc="TagSpaces is an open source personal data manager. It helps you organize files with tags on every platform."
arch=("x86_64")
url="http://tagspaces.org"
license=("AGPL")
provides=("tagspaces")
conflicts=("tagspaces")
sha256sums=('212b73327336eb7b4829a2e3b70edd4a3feb295ce176483654e7f5962f2a94cd')
source=("${_pkgname}-${pkgver}.deb::https://github.com/${_pkgname}/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-linux-amd64-${pkgver}.deb")

package() {
  bsdtar -xv -C "${pkgdir}" -f "${srcdir}/data.tar.xz"

  # symlink the main binary to a better location
  mkdir -p ${pkgdir}/usr/bin/
  ln -s /opt/TagSpaces/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
}
