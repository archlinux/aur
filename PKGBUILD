pkgname=ca-certificates-russian-root
pkgver=20260804
pkgrel=1
pkgdesc="Russian root certificates"
arch=('any')
url='https://gu-st.ru'
license=('unknown')
depends=(
    'ca-certificates-utils'
)
makedepends=()
# https://www.gosuslugi.ru/crt
source=(
    "https://gu-st.ru/content/lending/russian_trusted_sub_ca_pem.zip"
    "https://gu-st.ru/content/lending/linux_russian_trusted_root_ca_pem.zip"
)
sha256sums=(
    '35d8ce3ed079b1cd3a1650bf2ed2d873eee288799924dbbe128c172b65d3594e'
    'ca99ca9b0022ec8b99d5822502cf3f38d4797bdd02cc098996778421d72d7e24'
)


package() {
  cd "${srcdir}"
  for cert in *.crt; do
    install -Dm644 "${cert}" "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/${cert}"
  done
}
