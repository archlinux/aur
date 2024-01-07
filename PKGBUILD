# Maintainer: Neal Buchanan <neal.buchanan@gmx.com>

pkgname=buckets-bin
pkgver=0.72.1
pkgrel=1
pkgdesc="Private budgeting with the envelope budgeting method"
arch=('x86_64')
_arch="amd64"
url="https://www.budgetwithbuckets.com/"
license=('custom: commercial')
depends=('alsa-lib' 'gtk3' 'libxss' 'nss')
optdepends=()
_pkgname=Buckets-ubuntu-22.04
_archivename="${_pkgname}-${_arch}-${pkgver}.deb"
source=("https://github.com/buckets/application/releases/download/v${pkgver}/${_archivename}")
noextract=("${_archivename}")
sha256sums=('690b3e322176c3b97e0eb4625e915fa2fd402330f1e4b4cf98ead5a99f336980')

package() {
  bsdtar -O -xf "${_archivename}" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -

  install -d "${pkgdir}/usr/bin"

  # Remove unnecessary stuff
  rm -rf "${pkgdir}/usr/share/doc"

  ln -s /opt/${_pkgname}/buckets "${pkgdir}"/usr/bin/buckets
}
