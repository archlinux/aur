# Maintainer: GI_Jack <GI_Jack@hackermail.com>

# Original Work
#	Joe Davison <joe@warhaggis.com>
#	Felix Golatofski <contact@xdfr.de>
#	zer0def <zer0def on freenode>

pkgname=libpurple-signald
pkgver=0.6.0
pkgrel=1
pkgdesc='Pidgin libpurple bridge to signald.'
url='https://github.com/hoehermann/libpurple-signald'
license=('GPL3')
arch=('any')
depends=('json-glib' 'libpurple' 'signald')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/hoehermann/libpurple-signald/archive/v${pkgver}.tar.gz")
sha256sums=('331b30aa21a8dbd9a1c50f35e7cc20f538a3f3691553998a2f53045a4c1abe20')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm644 libsignald.so "${pkgdir}/usr/lib/purple-2/libsignald.so"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 icons/16/signal.png "${pkgdir}/usr/share/pixmaps/pidgin/protocols/16/signal.png"
  install -Dm644 icons/48/signal.png "${pkgdir}/usr/share/pixmaps/pidgin/protocols/48/signal.png"
}

