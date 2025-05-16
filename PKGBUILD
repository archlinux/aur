# Maintainer: Neal Buchanan <neal.buchanan@gmx.com>

pkgname=buckets-bin
pkgver=0.80.0
pkgrel=1
pkgdesc="Private budgeting with the envelope budgeting method"
arch=('x86_64')
_arch="amd64"
url="https://www.budgetwithbuckets.com/"
license=('custom: commercial')
depends=('alsa-lib' 'gtk3' 'libxss' 'nss')
optdepends=()
_pkgname=Buckets-linux-latest
_archivename="${_pkgname}-${_arch}-${pkgver}.deb"
source=("https://github.com/buckets/application/releases/download/v${pkgver}/${_archivename}")
noextract=("${_archivename}")
sha256sums=('f5fe84a7f079af60d1684799e106184736ef1fad6e29df50f3333495b64bfde0')

package() {
  bsdtar -O -xf "${_archivename}" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -

  install -d "${pkgdir}/usr/bin"

  # Remove unnecessary stuff
  rm -rf "${pkgdir}/usr/share/doc"

  ln -s /opt/Buckets/buckets "${pkgdir}"/usr/bin/buckets
}
