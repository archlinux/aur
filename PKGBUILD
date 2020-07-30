# Maintainer: Vyacheslav Konovalov <vyachkonovalov@protonmail.com>

_commit=ffb803cf3c0cdaeca2490e96a8d0bf804e9483bc
pkgname=deemix
pkgver=1.1.26
pkgrel=1
pkgdesc='A barebone deezer downloader library'
arch=(any)
url='https://deemix.app/'
license=('GPL3')
depends=('python>=3.6' 'python-click' 'python-pycryptodomex' 'python-mutagen' 'python-spotipy')
makedepends=('python-setuptools')
source=("https://codeberg.org/RemixDev/deemix/archive/$_commit.tar.gz")
sha256sums=('e719e29781634bcae56d667c0e326ce7fa5ab2e7d46be77eec1fd9894a135d75')

pkgver() {
  cd deemix
  sed -En 's/^__version__ = "([0-9\.]+)"$/\1/p' deemix/__init__.py | tr -d '\n'
}

build() {
  cd deemix
  python setup.py build
}

package() {
  cd deemix
  python setup.py install --root="$pkgdir" --optimize=1
}
