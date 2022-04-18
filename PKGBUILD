# Maintainer: Neal Buchanan <neal.buchanan@gmx.com>

pkgname=buckets-bin
_pkgname=Buckets
pkgver=0.66.2
pkgrel=1
pkgdesc="Private budgeting with the envelope budgeting method"
arch=('x86_64')
url="https://www.budgetwithbuckets.com/"
license=('custom: commercial')
depends=('alsa-lib' 'gtk3' 'libxss' 'nss')
optdepends=()
source=("https://github.com/buckets/application/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
noextract=("${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('16f784c00a40c9344a2a5da0e8679040fbb1bd3dbff86a6a945ddf4931c72575')

package() {
  bsdtar -O -xf "${_pkgname}_${pkgver}_amd64.deb" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -

  install -d "${pkgdir}/usr/bin"

  # Remove unnecessary stuff
  rm -rf "${pkgdir}/usr/share/doc"

  ln -s /opt/${_pkgname}/buckets "${pkgdir}"/usr/bin/buckets
}

