# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>
# Contributor: Samuel Walladge <samuel at swalladge dot net>

pkgname=tagspaces-bin
_pkgname=tagspaces
pkgver=5.1.4
pkgrel=1
pkgdesc="TagSpaces is an open source personal data manager. It helps you organize files with tags on every platform."
arch=("x86_64")
url="http://tagspaces.org"
license=("AGPL")
provides=("tagspaces")
conflicts=("tagspaces")
sha256sums=('46a137afee0061409eec6375d66a6861cb7bd05c40311161fd6e7291c8a2329c')
source=("${_pkgname}-${pkgver}.deb::https://github.com/${_pkgname}/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-linux-amd64-${pkgver}.deb")

package() {
  bsdtar -xv -C "${pkgdir}" -f "${srcdir}/data.tar.xz"

  # symlink the main binary to a better location
  mkdir -p ${pkgdir}/usr/bin/
  ln -s /opt/TagSpaces/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
}
