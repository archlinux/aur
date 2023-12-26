# Maintainer: Rodolphe Bréard <packages@what.tf>
pkgname=acmed-polkit-reload
_pkgname=acmed
pkgver=0.22.1
pkgrel=1
pkgdesc="Polkit rule allowing ACMEd to reload services"
arch=('any')
url="https://github.com/breard-r/acmed/"
license=('Apache' 'MIT')
depends=('acmed' 'polkit')
source=("10-acmed_${pkgver}.rules::https://raw.githubusercontent.com/breard-r/${_pkgname}/v${pkgver}/contrib/polkit/10-acmed.rules"
        "LICENSE-APACHE-2.0.txt::https://raw.githubusercontent.com/breard-r/${_pkgname}/v${pkgver}/LICENSE-APACHE-2.0.txt"
        "LICENSE-MIT.txt::https://raw.githubusercontent.com/breard-r/${_pkgname}/v${pkgver}/LICENSE-MIT.txt")
sha256sums=('91941313940c94c60226dfc0a45febbbdbfb6e1f87f2dd12756e973ad71b3a31'
            'cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30'
            '42f433b7fc7cf5d81dd223bde4f9d6ab45756a6aabcb82ded8908cd8f8af77ff')

package() {
  install -Dm644 "${srcdir}/10-acmed_${pkgver}.rules" "${pkgdir}/usr/share/polkit-1/rules.d/10-acmed.rules"
  chmod 750 "${pkgdir}/usr/share/polkit-1/rules.d"
  install -Dm644 "${srcdir}/LICENSE-APACHE-2.0.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE-2.0.txt"
  install -Dm644 "${srcdir}/LICENSE-MIT.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT.txt"
}
