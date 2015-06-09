# Maintainer: ajs124 < aur AT ajs124 DOT de >

pkgname=unigine-sanctuary
_pkgname=Unigine_Sanctuary
pkgver=2.3
pkgrel=2
pkgdesc="Unigine Benchmark"
arch=('i686' 'x86_64')
url="http://www.unigine.com"
license=('unknown')
depends=(openal libgl)
[ "$CARCH" = "x86_64" ] && depends+=(lib32-openal lib32-libgl lib32-libxinerama lib32-libxrandr)
source=(http://www.phoronix-test-suite.com/benchmark-files/${_pkgname}-${pkgver}.run
	unigine-sanctuary)
sha512sums=('18b6e21749091316cbba4eb1354dbef2d1316e5e302e7dcc1c57fa989abb22c60d3a7f8fe1a6ebd52866a1bf7b3a51b7134927b514021c8e8934b80ba0d1bb24'
            '2f3ad92c91b68b60d67759b0d7f80bc27b4f0dd71407a7929948670df624ea904b1eea6c867dee7d60481def2113e0f3b6fd34e1ec5a694da3770fc1a62d107c')

package(){
  sh ${_pkgname}-${pkgver}.run
  install -m755 -d ${pkgdir}/opt/${pkgname} 
  cp -R ${srcdir}/sanctuary/bin/ ${pkgdir}/opt/${pkgname}/
  cp -R ${srcdir}/sanctuary/data/ $pkgdir/opt/${pkgname}/
  install ${pkgname} -Dm755 ${pkgdir}/usr/bin/${pkgname}
}
