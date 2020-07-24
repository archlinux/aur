# Maintainer: Vyacheslav Konovalov <vyachkonovalov@protonmail.com>

_commit=ec38923701bbfcdfe77f6dbb7f878655a3e1eb02
pkgname=deemix
pkgver=1.1.19
pkgrel=1
pkgdesc='A barebone deezer downloader library'
arch=(any)
url='https://deemix.app/'
license=('GPL3')
depends=('python>=3.6' 'python-click' 'python-pycryptodomex' 'python-mutagen' 'python-spotipy')
makedepends=('python-setuptools')
source=("https://codeberg.org/RemixDev/deemix/archive/$_commit.tar.gz")
sha256sums=('e963e2876b3e4f47b2cb590f87e78150955b96c01eaab505faff264a8a0ea87a')

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
