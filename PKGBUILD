# Maintainter: Alexander Solovyov <alexander dot solovyov dot dev at gmail>
# Contributor: Michael Schubert <mschu.dev at gmail>
# Contributor: Mick Elliot <micke at sfu dot ca>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
pkgname=last-align
_pkgname=last
pkgver=1453
pkgrel=1
pkgdesc="Genome-scale comparison of biological sequences"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('zlib')
optdepends=('bash: interpreter for some bundled scripts'
            'python: interpreter for some bundled scripts')

url="https://gitlab.com/mcfrith/last"
source=("https://gitlab.com/mcfrith/$_pkgname/-/archive/$pkgver/$_pkgname-$pkgver.tar.gz")
sha256sums=('d57f5588de01acaa68d1fd67972da7a71ea6987ab3c3ec687462bf2d83cfc65d')

build() {
  cd "$srcdir/$_pkgname-$pkgver/"
  make all
}

package() {
  cd "$srcdir/$_pkgname-$pkgver/"
  make install prefix="$pkgdir/usr"
}
