# Maintainer: Vyacheslav Konovalov <vyachkonovalov@protonmail.com>

_commit=09331516c7e96099cb9bb15646a95cb5502c5dbd
pkgname=deemix
pkgver=1.4.2
pkgrel=1
pkgdesc='A barebone deezer downloader library'
arch=(any)
url='https://deemix.app/'
license=('GPL3')
depends=('python>=3.6' 'python-click' 'python-pycryptodomex' 'python-mutagen' 'python-spotipy'
         'python-eventlet')
makedepends=('python-setuptools')
source=("https://codeberg.org/RemixDev/deemix/archive/$_commit.tar.gz")
sha256sums=('4c2832b06457d1d480b19d189e6ff8b1f93d9dd17f7af35b6e03c014635b028c')

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
