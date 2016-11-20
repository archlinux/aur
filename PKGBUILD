# Maintainer: sL1pKn07 <sl1pkn07@gmail.com
# Contributor: Blackleg <blackleg@openaliasbox.org>

DLAGENTS=("https::/usr/bin/curl -k -o %o %u")
pkgname=ca-certificates-fnmt
pkgver=201611
pkgrel=1
pkgdesc="Spanish Fabrica Nacional de Moneda y Timbre root certificates"
arch=(any)
url='https://www.sede.fnmt.gob.es'
license=('unknown')
depends=('ca-certificates-utils')
source=('https://www.sede.fnmt.gob.es/documents/11614/116099/FNMTClase2CA.cer'
        'https://www.sede.fnmt.gob.es/documents/11614/116099/AC_Raiz_FNMT-RCM_SHA256.cer'
        )
sha256sums=('62b9267266212832a8e22dab933d91c7011274acf71703f9cc97833751a6e94f'
            'ebc5570c29018c4d67b1aa127baf12f703b4611ebc17b7dab5573894179b93fa'
            )

package() {
  install -d "${pkgdir}/usr/share/ca-certificates/trust-source/anchors"
  install -Dm644 FNMTClase2CA.cer "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/FNMTClase2CA.cer"
  install -Dm644 AC_Raiz_FNMT-RCM_SHA256.cer "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/AC_Raiz_FNMT-RCM_SHA256.cer"
}
