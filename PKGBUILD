pkgname=moka-icon-theme
pkgver=5.3.3
pkgrel=1
pkgdesc="A stylized Linux desktop icon set, designed to be clear, simple and consistent."
arch=('any')
url="https://snwh.org/moka"
license=('GPL3' 'CCPL-4.0:by-sa')
depends=('faba-icon-theme')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/moka-project/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('4c552cd2f7e7a22720678540781069c9')
sha512sums=('21567804dedc35d3c3f0957f525b66ff7f9b05365af94cf33b0248279ae78e8a6a5646ab4ecbf5715d04a7e5043ebb45810484132a55dad253d1fc6820ccaf3c')

build() {
  cd "$pkgname-$pkgver"
  bash autogen.sh
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
