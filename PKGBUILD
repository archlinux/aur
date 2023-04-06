# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=ipyxact
pkgname=python-$_pkgname
pkgver=0.3.2
pkgrel=2
pkgdesc='Python-based IP-XACT parser'
arch=('any')
url='https://github.com/olofk/ipyxact'
license=('MIT')
depends=('python' 'python-yaml')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('7048b914616135d5a7319d4bf93208da2fe02f8ea76a95a7000b64e40866b6e4064e0bf43705ad0a026e383f6c78a803768499a29c838f2fc6359bafeafb6a32')

build() {
  cd $_pkgname-$pkgver

  python -m build -nw
}

package() {
  cd $_pkgname-$pkgver

  python -m installer -d "$pkgdir" dist/*.whl

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
