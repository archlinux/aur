# Maintainer: Benjamin Chausse <benjamin@chausse.xyz>
pkgname='termpicker'
pkgver=1.3.9
pkgrel=1
pkgdesc="A color picker for the terminal"
arch=('x86_64')
url="https://github.com/ChausseBenjamin/termpicker"
license=('Beerware')
groups=()
depends=()
makedepends=()
options=('!debug')

optdepends=(
  'wl-clipboard: clipboard support on wayland'
  'xsel: clipboard support on X11'
)

provides=('termpicker')
source=(
  "$pkgname-v$pkgver.tar.gz::$url/releases/download/v$pkgver/${pkgname}_Linux_x86_64.tar.gz"
)


sha256sums=('880a960adaf4183c2f0aa3eb254a6c2812c926816192d9575d90b012684ac65b')


package() {
	install -Dm755 $pkgname "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 $pkgname.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
