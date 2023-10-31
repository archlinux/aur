# Maintainer: dreieck

_pkgname="ungoogled-chromium-chromedriver-provides"
pkgname="${_pkgname}"
pkgver=118.0.5993.117
pkgrel=1
pkgdesc="Dummy/ meta package that depends on 'ungoogled-chromium' and fulfills the 'chromedriver' dependency."
arch=("any")
license=('custom: public domain')
depends=("ungoogled-chromium")
provides=(
  "chromedriver=${pkgver}"
)
conflicts=()

source=(
  'license-metapackage-pd.txt'
)
sha256sums=(
  'af68dd29515606a94237214e4c33b0e3f4f2408ed92df3674a043bf2fa2c0078'
)

pkgver() {
  pacman -Q ungoogled-chromium | cut -d ' ' -f 2 | sed -E 's|-.*||'
}

package() {
  install -D -v -m644 "${srcdir}/license-metapackage-pd.txt" "${pkgdir}/usr/share/licenses/${pkgname}/copying.public-domain.txt"
}
