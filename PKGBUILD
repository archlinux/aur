# Maintainer: Samuel Walladge <samuel at swalladge dot id dot au>

pkgname=tagspaces-bin
_pkgname=tagspaces
pkgver=3.0.0_beta.18
# upstream pkgver - has a hyphen which is not allowed
_pkgver="3.0.0-beta.18"
pkgrel=1
pkgdesc="TagSpaces is an open source personal data manager. It helps you organize files with tags on every platform."
arch=("x86_64")
url="http://tagspaces.org"
license=("AGPL")
provides=("tagspaces")
conflicts=("tagspaces")
sha256sums=('cff19f3f8b2e83914ff6901fcbf8e4c4487a272f723127ff5bd1b71d24760235')
source=("${_pkgname}-${_pkgver}.deb::https://github.com/${_pkgname}/${_pkgname}/releases/download/v${_pkgver}/${_pkgname}-linux-amd64-${_pkgver}.deb")

package() {
  bsdtar -xv -C "${pkgdir}" -f "${srcdir}/data.tar.xz"

  # symlink the main binary to a better location
  mkdir -p ${pkgdir}/usr/bin/
  ln -s /opt/TagSpaces/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
}
