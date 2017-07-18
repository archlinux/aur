# Maintainer: sL1pKn07 <sl1pkn07@gmail.com
# Contributor: Blackleg <blackleg@openaliasbox.org>

DLAGENTS=("https::/usr/bin/curl -k -o %o %u")
pkgname=ca-certificates-dnie
pkgver=20170718
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
        'AC_RAIZ_DNIE_2_SHA2.cab::https://www.dnielectronico.es/ZIP/ACRAIZ-DNIE2.cab'
        # Autoridades de Certificación, AC Subordinadas
        'AC_DNIE_004_SHA2.crt::https://www.dnielectronico.es/ZIP/AC_DNIE_004.crt'
        'AC_DNIE_005_SHA2.crt::https://www.dnielectronico.es/ZIP/AC_DNIE_005.crt'
        'AC_DNIE_006_SHA2.crt::https://www.dnielectronico.es/ZIP/AC_DNIE_006.crt'
        # Autoridad de Validación AV DNIE MINHAP
        'AV_DNIE_MINHAP_SHA2.zip::https://www.dnielectronico.es/descargas/certificados/AVDNIEMINHAP_SHA2.zip'
        # Autoridad de Validación AV DNIE FNMT
        'AV_DNIE_FNMT_SHA2.rar::https://www.dnielectronico.es/descargas/certificados/Ocsp%20Responder%20AV%20DNIE-FNMT_SHA2.rar'
        )
sha256sums=('279745f40e4bd75f5ef72f2e02efe417a1a07e27fb5a9810fddbcfd40ac00f39'
            'ebae99303045630764dc5cf9d5af9dc009354d8729c407b6bf9a136208046f6c'
            'dbb9102b673343c281927c13b9cf92b8a49bcd2188d6e216107e2f0580b5754c'
            'c4bb69dc80a9cf28a83438455b11f3cb239f3be68b3c23171560c5d657ebf653'
            '171f5c664bb2ccfd0cf130d782c18205d17cae08aa86bffa772bdc0d4897a3ad'
            '50786cac947f1c474372d14c1c6f5e56e390faa52f0967ba1510774a92372c74'
            )

package() {
  install -Dm644 "AC RAIZ DNIE 2.crt"                   "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/AC_RAIZ_DNIE_2_SHA2.crt"
  install -Dm644 "AC_DNIE_004_SHA2.crt"                 "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/AC_DNIE_004_SHA2.crt"
  install -Dm644 "AC_DNIE_005_SHA2.crt"                 "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/AC_DNIE_005_SHA2.crt"
  install -Dm644 "AC_DNIE_006_SHA2.crt"                 "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/AC_DNIE_006_SHA2.crt"
  install -Dm644 "AVDNIEMINHAP_SHA2.cer"                "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/AV_DNIE_MINHAP_SHA2.cer"
  install -Dm644 "AV DNIE FNMT 2017.cer" "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/AV_DNIE_FNMT_SHA2.cer"
}
