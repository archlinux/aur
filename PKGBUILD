# Maintainer: sL1pKn07 <sl1pkn07@gmail.com
# Contributor: Blackleg <blackleg@openaliasbox.org>

DLAGENTS=("https::/usr/bin/curl -k -o %o %u")
pkgname=ca-certificates-dnie
pkgver=20180411
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
        'AC_RAIZ-DNIE_SHA2.CAB::https://www.dnielectronico.es/ZIP/ACRAIZ-SHA2.CAB'
        'AC_RAIZ_DNIE_2_SHA2.cab::https://www.dnielectronico.es/ZIP/ACRAIZ-DNIE2.cab'

        # Autoridades de Certificación, AC Subordinadas
        'AC_DNIE_001_SHA2.crt::https://www.dnielectronico.es/ZIP/ACDNIE001-SHA2.crt'
        'AC_DNIE_002_SHA2.crt::https://www.dnielectronico.es/ZIP/ACDNIE002-SHA2.crt'
        'AC_DNIE_003_SHA2.crt::https://www.dnielectronico.es/ZIP/ACDNIE003-SHA2.crt'
        'AC_DNIE_004_SHA2.crt::https://www.dnielectronico.es/ZIP/AC_DNIE_004.crt'
        'AC_DNIE_005_SHA2.crt::https://www.dnielectronico.es/ZIP/AC_DNIE_005.crt'
        'AC_DNIE_006_SHA2.crt::https://www.dnielectronico.es/ZIP/AC_DNIE_006.crt'
        # Autoridad de Validación AV DNIE FNMT
        'AV_DNIE_FNMT_SHA2.zip::https://www.dnielectronico.es/descargas/certificados/Ocsp_Responder_AV_DNIE_FNMT_2017_SHA-2.zip'
        # Autoridad de Validación AV DNIE MINHAP
#         'AV_DNIE_MINHAP_SHA2.zip::https://www.dnielectronico.es/descargas/certificados/AVDNIEMINHAP_SHA2.zip'

        )
sha256sums=('2e84b159b7b4de499e15ff237bb613f447dabd5bf1e92b78fc000ff38917fe18'
            '279745f40e4bd75f5ef72f2e02efe417a1a07e27fb5a9810fddbcfd40ac00f39'
            '1bb2b77267f92cd8e63e0a05a39fd9d51ad7b38a4fa0f35ccc78ea0fdabd8ac5'
            '8107be4d92577bc33a98233d6d2081c2b12fdf6670142995e3c4bba1942ea21f'
            'f6129dc0ba4e23dc6371e08be0cb7c8bb1457e080bf6d2c6af03f5949dea548a'
            'ebae99303045630764dc5cf9d5af9dc009354d8729c407b6bf9a136208046f6c'
            'dbb9102b673343c281927c13b9cf92b8a49bcd2188d6e216107e2f0580b5754c'
            'c4bb69dc80a9cf28a83438455b11f3cb239f3be68b3c23171560c5d657ebf653'
            '0ba80837d2f513fe103371c30fddecec9e5f29ade3b8bfd767d0a784e18de059'
            )

package() {
  install -Dm644 "ACRAIZ-SHA2.crt"                      "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/AC_RAIZ_DNIE_SHA2.crt"
  install -Dm644 "AC RAIZ DNIE 2.crt"                   "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/AC_RAIZ_DNIE_2_SHA2.crt"
  install -Dm644 "AC_DNIE_001_SHA2.crt"                 "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/AC_DNIE_001_SHA2.crt"
  install -Dm644 "AC_DNIE_002_SHA2.crt"                 "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/AC_DNIE_002_SHA2.crt"
  install -Dm644 "AC_DNIE_003_SHA2.crt"                 "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/AC_DNIE_003_SHA2.crt"
  install -Dm644 "AC_DNIE_004_SHA2.crt"                 "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/AC_DNIE_004_SHA2.crt"
  install -Dm644 "AC_DNIE_005_SHA2.crt"                 "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/AC_DNIE_005_SHA2.crt"
  install -Dm644 "AC_DNIE_006_SHA2.crt"                 "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/AC_DNIE_006_SHA2.crt"
  install -Dm644 "VADNI2_2017.cer"                      "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/AV_DNIE_FNMT_SHA2.cer"
#   install -Dm644 "AVDNIEMINHAP_SHA2.cer"                "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/AV_DNIE_MINHAP_SHA2.cer"
}
