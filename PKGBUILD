# Maintainer: sL1pKn07 <sl1pkn07@gmail.com
# Contributor: Blackleg <blackleg@openaliasbox.org>

DLAGENTS=("https::/usr/bin/curl -k -o %o %u")
pkgname=ca-certificates-dnie
pkgver=20191226
pkgrel=1
pkgdesc="Spanish DNIE root certificates"
arch=('any')
url='http://www.dnielectronico.es'
license=('unknown')
depends=('ca-certificates-utils'
         'ca-certificates-fnmt'
         )
source=(
        # Autoridad de Certificación Raíz del DNIe
        'https://www.dnielectronico.es/ZIP/ACRAIZ-DNIE2.zip'
        'https://www.dnielectronico.es/ZIP/ACRAIZ-SHA2.zip'

        # Autoridades de Certificación, AC Subordinadas
        'AC_DNIE_001_SHA2.crt::https://www.dnielectronico.es/ZIP/ACDNIE001-SHA2.crt'
        'AC_DNIE_002_SHA2.crt::https://www.dnielectronico.es/ZIP/ACDNIE002-SHA2.crt'
        'AC_DNIE_003_SHA2.crt::https://www.dnielectronico.es/ZIP/ACDNIE003-SHA2.crt'
        'AC_DNIE_004_SHA2.crt::https://www.dnielectronico.es/ZIP/AC_DNIE_004.crt'
        'AC_DNIE_005_SHA2.crt::https://www.dnielectronico.es/ZIP/AC_DNIE_005.crt'
        'AC_DNIE_006_SHA2.crt::https://www.dnielectronico.es/ZIP/AC_DNIE_006.crt'
        # Autoridad de Validación AV DNIE FNMT
        'AV_DNIE_FNMT_SHA2.zip::https://www.dnielectronico.es/descargas/certificados/Certificados_OCSP_Responder_FNMT.zip'
        # Autoridad de Validación AV DNIE MINHAP
#         'AV_DNIE_MINHAP_SHA2.zip::https://www.dnielectronico.es/descargas/certificados/AVDNIEMINHAP_SHA2.zip'

        )
sha256sums=('6e0235376d543d19c7fa765b66ec14fab785e0fb6076b16682649eb3934655bd'
            'cbb602e2e7f743b7190398960a64d5e71792bec6f468d2bdded414547d367edd'
            '1bb2b77267f92cd8e63e0a05a39fd9d51ad7b38a4fa0f35ccc78ea0fdabd8ac5'
            '8107be4d92577bc33a98233d6d2081c2b12fdf6670142995e3c4bba1942ea21f'
            'f6129dc0ba4e23dc6371e08be0cb7c8bb1457e080bf6d2c6af03f5949dea548a'
            'ebae99303045630764dc5cf9d5af9dc009354d8729c407b6bf9a136208046f6c'
            'dbb9102b673343c281927c13b9cf92b8a49bcd2188d6e216107e2f0580b5754c'
            'c4bb69dc80a9cf28a83438455b11f3cb239f3be68b3c23171560c5d657ebf653'
            '16104f843fe99f06f8b30d93e32e53d042db815f06aa9bd73fd710ec444566c7'
            )


DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")


package() {
  install -Dm644 "ACRAIZ-SHA2.cer"                                                          "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/AC_RAIZ_DNIE_SHA2.cer"
  install -Dm644 "AC RAIZ DNIE 2.crt"                                                       "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/AC_RAIZ_DNIE_2_SHA2.crt"
  install -Dm644 "AC_DNIE_001_SHA2.crt"                                                     "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/AC_DNIE_001_SHA2.crt"
  install -Dm644 "AC_DNIE_002_SHA2.crt"                                                     "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/AC_DNIE_002_SHA2.crt"
  install -Dm644 "AC_DNIE_003_SHA2.crt"                                                     "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/AC_DNIE_003_SHA2.crt"
  install -Dm644 "AC_DNIE_004_SHA2.crt"                                                     "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/AC_DNIE_004_SHA2.crt"
  install -Dm644 "AC_DNIE_005_SHA2.crt"                                                     "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/AC_DNIE_005_SHA2.crt"
  install -Dm644 "AC_DNIE_006_SHA2.crt"                                                     "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/AC_DNIE_006_SHA2.crt"
  install -Dm644 "Certificados OCSP Responder FNMT/OCSP Responder DNIE 001.cer"             "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/OCSP_Responder_DNIE_001.cer"
  install -Dm644 "Certificados OCSP Responder FNMT/OCSP Responder DNIE 002.cer"             "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/OCSP_Responder_DNIE_002.cer"
  install -Dm644 "Certificados OCSP Responder FNMT/OCSP Responder DNIE 003.cer"             "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/OCSP_Responder_DNIE_003.cer"
  install -Dm644 "Certificados OCSP Responder FNMT/OCSP Responder DNIE 004.cer"             "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/OCSP_Responder_DNIE_004.cer"
  install -Dm644 "Certificados OCSP Responder FNMT/OCSP Responder DNIE 005.cer"             "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/OCSP_Responder_DNIE_005.cer"
  install -Dm644 "Certificados OCSP Responder FNMT/OCSP Responder DNIE 006.cer"             "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/OCSP_Responder_DNIE_006.cer"
#   install -Dm644 "AVDNIEMINHAP_SHA2.cer"                "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/AV_DNIE_MINHAP_SHA2.cer"
}
