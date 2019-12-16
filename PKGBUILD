# Maintainer: Adrian Petrescu <adrian@apetre.sc>

pkgname=python-pykka
pkgver=2.0.2
pkgrel=1
pkgdesc="Easy to use concurrency abstractions for Python using the actor model"
arch=('any')
url="http://pykka.readthedocs.org/"
license=('Apache')
depends=('python')
makedepends=('python-setuptools')
optdepends=('python-gevent: Use gevent based actors from pykka.gevent')
provides=('python-pykka')
conflicts=('python-pykka-git')
source=("https://pypi.python.org/packages/source/P/Pykka/Pykka-$pkgver.tar.gz")
sha512sums=('98b2e6122dc5158da489265cf7cf9e358bfa432d0a0eaab9f50a07c0050083afb19aad494e4cd27347c376947eafb7d9796909c18e3648ef1bf0685bd6384e5b')

package() {
  cd "$srcdir/Pykka-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir"/ --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

