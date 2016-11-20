# Maintainer: sL1pKn07 <sl1pkn07@gmail.com
# Contributor: Blackleg <blackleg@openaliasbox.org>

DLAGENTS=("https::/usr/bin/curl -k -o %o %u")
pkgname=ca-certificates-dnie
pkgver=201609
pkgrel=1
pkgdesc="Spanish DNIE root certificates"
arch=(any)
url='http://www.dnielectronico.es'
license=('unknown')
depends=('ca-certificates-utils'
         'ca-certificates-fnmt'
         )
source=('https://www.dnielectronico.es/ZIP/ACRAIZ-DNIE2.cab'
        'https://www.dnielectronico.es/ZIP/ACDNIE004.zip'
        'https://www.dnielectronico.es/ZIP/AC_DNIE_005.zip'
        'https://www.dnielectronico.es/ZIP/AC_DNIE_006.zip'
        )

sha256sums=('279745f40e4bd75f5ef72f2e02efe417a1a07e27fb5a9810fddbcfd40ac00f39'
            'c31b68bb3eefadcbbfa3634f9cae733691ae40e4b7eeb6df9744676898cf7729'
            '03ef90cb69a97ae66bed937f256960c6238c385d9defdaac08bba51d49be0ffc'
            'b168e63cbb41ece42cb0688d1f250e020c56195de881e70c4e69e9d5c5f09b8d'
            )

package() {
  install -d "${pkgdir}/usr/share/ca-certificates/trust-source/anchors"
  install -Dm644 "AC RAIZ DNIE 2.crt" "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/AC_RAIZ_DNIE_2.crt"
  install -Dm644 "AC DNIE 004.crt" "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/AC_DNIE_004.crt"
  install -Dm644 "AC_DNIE_005.crt" "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/AC_DNIE_005.crt"
  install -Dm644 "AC_DNIE_006.crt" "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/AC_DNIE_006.crt"
}
