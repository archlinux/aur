# Maintainer: Vyacheslav Konovalov <vyachkonovalov@protonmail.com>

_commit=a9a09c58e06b6f333676ade4c6ade3eb4f391a2d
pkgname=deemix
pkgver=1.5.13
pkgrel=1
pkgdesc='A barebone deezer downloader library'
arch=(any)
url='https://deemix.app/'
license=('GPL3')
depends=('python>=3.6' 'python-click' 'python-pycryptodomex' 'python-mutagen' 'python-spotipy'
         'python-eventlet')
makedepends=('python-setuptools')
source=("https://codeberg.org/RemixDev/deemix/archive/$_commit.tar.gz")
sha256sums=('b627a504809ea64bfbba6a1ac9794811b7d1b53f1f7b7f0cc2503ee2924dad98')

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
