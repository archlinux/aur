# Maintainer: Vyacheslav Konovalov <vyachkonovalov@protonmail.com>

_commit=830c76ff1cff856e381d07890cce951c2b167a09
pkgname=deemix
pkgver=1.2.1
pkgrel=1
pkgdesc='A barebone deezer downloader library'
arch=(any)
url='https://deemix.app/'
license=('GPL3')
depends=('python>=3.6' 'python-click' 'python-pycryptodomex' 'python-mutagen' 'python-spotipy')
makedepends=('python-setuptools')
source=("https://codeberg.org/RemixDev/deemix/archive/$_commit.tar.gz")
sha256sums=('066665952e6b972baa35a4958089d0d3930bf1e2d438e0a203f4de4e4b94b484')

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
