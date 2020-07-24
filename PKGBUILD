# Maintainer: Philipp Rempe <me@ph1l.wtf>
_commit=3e5c1920168773ccf813cc0e405683bf5cec6dcb
pkgname=tq
pkgver=0.2.1
pkgrel=1
pkgdesc='tq is command line utility that performs an HTML element selection on HTML content passed to the stdin. Using css selectors that everybody knows.'
arch=(any)
url='https://github.com/plainas/tq'
license=('MIT')
depends=('python>=3.6' 'python-beautifulsoup4')
makedepends=('python-setuptools')
source=("https://github.com/plainas/tq/archive/$_commit.tar.gz")
sha256sums=('3dbcd027e4b85c6be7b06d91599ea2ce43559f36a9a59405658983c2f47bf4d0')

build() {
  cd "tq-$_commit"
  python setup.py build
}

package() {
  cd "tq-$_commit"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 -t "${pkgdir}/usr/share/man/man1" ./doc/tq.1
}
