# Maintainer: Vyacheslav Konovalov <vyachkonovalov@protonmail.com>

_commit=2e8bae427d15eea71d00fc5fcf2d87f8ad345100
pkgname=deemix
pkgver=1.5.6
pkgrel=1
pkgdesc='A barebone deezer downloader library'
arch=(any)
url='https://deemix.app/'
license=('GPL3')
depends=('python>=3.6' 'python-click' 'python-pycryptodomex' 'python-mutagen' 'python-spotipy'
         'python-eventlet')
makedepends=('python-setuptools')
source=("https://codeberg.org/RemixDev/deemix/archive/$_commit.tar.gz")
sha256sums=('54a0665ea91d1c9a8dfc51ea585a136e67155495b50227df018dcc20ac9d1295')

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
