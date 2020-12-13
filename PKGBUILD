# Maintainer: sL1pKn07 <sl1pkn07@gmail.com
# Contributor: Blackleg <blackleg@openaliasbox.org>

pkgname=ca-certificates-dnie
pkgver=20201212
pkgrel=2
pkgdesc="Spanish DNIE root certificates"
arch=('any')
url='http://www.dnielectronico.es'
license=('unknown')
depends=('ca-certificates-utils'
         'ca-certificates-fnmt'
         )
# makedepends=('unzip-iconv')
source=(
        # Autoridad de Certificación Raíz del DNIe
        'https://www.dnielectronico.es/ZIP/ACRAIZ-DNIE2.zip'
        'https://www.dnielectronico.es/ZIP/ACRAIZ-SHA2.zip'

        # Autoridades de Certificación, AC Subordinadas
        'https://www.dnielectronico.es/ZIP/ACDNIE001.crt.zip'
        'https://www.dnielectronico.es/ZIP/ACDNIE002.crt.zip'
        'https://www.dnielectronico.es/ZIP/ACDNIE003.crt.zip'
        'https://www.dnielectronico.es/ZIP/ACDNIE004.crt.zip'
        'https://www.dnielectronico.es/ZIP/ACDNIE005.crt.zip'
        'https://www.dnielectronico.es/ZIP/ACDNIE006.crt.zip'
        # Autoridad de Validación AV DNIE FNMT
        'AV_DNIE_FNMT_SHA2.zip::https://www.dnielectronico.es/descargas/certificados/Certificados_OCSP_Responder_FNMT.zip'
        # Autoridad de Validación AV DNIE MINHAP
        'AV_DNIE_MINHAP_SHA2.zip::https://www.dnielectronico.es/descargas/certificados/AVDNIEMINHAP_SHA2.zip'

        )
sha256sums=('6e0235376d543d19c7fa765b66ec14fab785e0fb6076b16682649eb3934655bd'
            'cbb602e2e7f743b7190398960a64d5e71792bec6f468d2bdded414547d367edd'
            'dfdaa0b0cb3627845bdf9fb2634e9bc2e06955446abb0d676480ea8f811b1ae5'
            '9791b3f198842e243c750c57ae097b8fd9f7964ea92553f6373f74c6c8967600'
            'cc42a87c7e79aeff559d61440450ec371b8fd70c098eb328ca32d07e909ae4cf'
            '7571df00556f41af9b552982f102529c20adb597fafe0865ccee89f735193458'
            '948ca3f851a4fd11483af67761c4d0603036231ec0611fe06d0e93212ac4d172'
            '25588e7328336f999a2650f60041f5fc107f1709960636b4a14b84cd8b866d54'
            'c84abb9059b350c083b5849a47ffcf79c6cb7369dba1797d9e582df1eba51431'
            '171f5c664bb2ccfd0cf130d782c18205d17cae08aa86bffa772bdc0d4897a3ad'
            )
makedepends=('convmv')
DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")

prepare() {
  convmv -f cp437 -t utf-8 -r --notest "Certificados OCSP Responder FNMT_Renovaci"*
}

package() {
  install -Dm644 "ACRAIZ-SHA2.cer"                                                                            "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/AC_RAIZ_DNIE_SHA2.cer"
  install -Dm644 "AC RAIZ DNIE 2.crt"                                                                         "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/AC_RAIZ_DNIE_2_SHA2.crt"
  install -Dm644 "AC DNIE 001.crt"                                                                            "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/AC_DNIE_001_SHA2.crt"
  install -Dm644 "AC DNIE 002.crt"                                                                            "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/AC_DNIE_002_SHA2.crt"
  install -Dm644 "AC DNIE 003.crt"                                                                            "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/AC_DNIE_003_SHA2.crt"
  install -Dm644 "AC DNIE 004.crt"                                                                            "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/AC_DNIE_004_SHA2.crt"
  install -Dm644 "AC DNIE 005.crt"                                                                            "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/AC_DNIE_005_SHA2.crt"
  install -Dm644 "AC DNIE 006.crt"                                                                            "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/AC_DNIE_006_SHA2.crt"
  install -Dm644 "Certificados OCSP Responder FNMT_Renovación_Diciembre_2020.cer/AV DNIE FNMT.cer"            "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/AV_DNIE_FNMT.cer"
  install -Dm644 "Certificados OCSP Responder FNMT_Renovación_Diciembre_2020.cer/OCSP Responder DNIE 001.cer" "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/OCSP_Responder_DNIE_001.cer"
  install -Dm644 "Certificados OCSP Responder FNMT_Renovación_Diciembre_2020.cer/OCSP Responder DNIE 002.cer" "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/OCSP_Responder_DNIE_002.cer"
  install -Dm644 "Certificados OCSP Responder FNMT_Renovación_Diciembre_2020.cer/OCSP Responder DNIE 003.cer" "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/OCSP_Responder_DNIE_003.cer"
  install -Dm644 "Certificados OCSP Responder FNMT_Renovación_Diciembre_2020.cer/OCSP Responder DNIE 004.cer" "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/OCSP_Responder_DNIE_004.cer"
  install -Dm644 "Certificados OCSP Responder FNMT_Renovación_Diciembre_2020.cer/OCSP Responder DNIE 005.cer" "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/OCSP_Responder_DNIE_005.cer"
  install -Dm644 "Certificados OCSP Responder FNMT_Renovación_Diciembre_2020.cer/OCSP Responder DNIE 006.cer" "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/OCSP_Responder_DNIE_006.cer"
  install -Dm644 "AVDNIEMINHAP_SHA2.cer"                                                                      "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/AV_DNIE_MINHAP_SHA2.cer"
}
