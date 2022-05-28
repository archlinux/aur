# Maintainter: Alexander Solovyov <alexander dot solovyov dot dev at gmail>
# Contributor: Michael Schubert <mschu.dev at gmail>
# Contributor: Mick Elliot <micke at sfu dot ca>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
pkgname=last-align
_pkgname=last
pkgver=1296
pkgrel=1
pkgdesc="Genome-scale comparison of biological sequences"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('zlib')
optdepends=('bash: interpreter for some bundled scripts'
            'python: interpreter for some bundled scripts')

url="https://gitlab.com/mcfrith/last"
source=("https://gitlab.com/mcfrith/$_pkgname/-/archive/$pkgver/$_pkgname-$pkgver.tar.gz")
sha256sums=('7d75aa98400318814ac08a0db2bb816fb3ad99834d97677b292c56ad59ff60fc')

build() {
  cd "$srcdir/$_pkgname-$pkgver/"
  make all
}

package() {
  cd "$srcdir/$_pkgname-$pkgver/"
  make install prefix="$pkgdir/usr"
}
