# Maintainer: Samuel Walladge <samuel at swalladge dot id dot au>

pkgname=tagspaces-bin
_pkgname=tagspaces
pkgver=3.0.0_beta.12
# upstream pkgver - has a hyphen which is not allowed
_pkgver="3.0.0-beta.12"
pkgrel=1
pkgdesc="TagSpaces is an open source personal data manager. It helps you organize files with tags on every platform."
arch=("x86_64")
url="http://tagspaces.org"
license=("AGPL")
makedepends=("bower" "gendesk")
provides=("tagspaces")
conflicts=("tagspaces")
sha256sums=('e1f29188815c231c4ff9cd75c61ead0df9b6d0268c5071ba026832cc6b716f8a')
source=("${_pkgname}-${_pkgver}.deb::https://github.com/${_pkgname}/${_pkgname}/releases/download/v${_pkgver}/${_pkgname}-linux-amd64-${_pkgver}.deb")

package() {
  bsdtar -xv -C "${pkgdir}" -f "${srcdir}/data.tar.xz"

  # symlink the main binary to a better location
  mkdir -p ${pkgdir}/usr/bin/
  ln -s /opt/TagSpaces/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
}
