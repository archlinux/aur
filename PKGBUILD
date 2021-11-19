# Maintainer: GI_Jack <GI_Jack@hackermail.com>

# Original Work
#	Joe Davison <joe@warhaggis.com>
#	Felix Golatofski <contact@xdfr.de>
#	zer0def <zer0def on freenode>

pkgname=libpurple-signald
pkgver=0.8.0
pkgrel=1
pkgdesc='Pidgin libpurple bridge to signald.'
url='https://github.com/hoehermann/libpurple-signald'
license=('GPL3')
arch=('any')
conflicts=('libpurple-signald-git')
depends=('json-glib' 'libpurple' 'signald' 'qrencode')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/hoehermann/libpurple-signald/archive/v${pkgver}.tar.gz")
sha256sums=('b04394f932bd8461c5db0d06f110635b85a693764e2a60864b52b3b23990a1c9')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make all
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm644 libsignald.so "${pkgdir}/usr/lib/purple-2/libsignald.so"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 icons/16/signal.png "${pkgdir}/usr/share/pixmaps/pidgin/protocols/16/signal.png"
  install -Dm644 icons/48/signal.png "${pkgdir}/usr/share/pixmaps/pidgin/protocols/48/signal.png"

}

