# Maintainer: Vyacheslav Konovalov <vyachkonovalov@protonmail.com>

_commit=41f1e44a6f75d7f19b4dbf886ef17b9ce1c2587e
pkgname=deemix
pkgver=1.1.27
pkgrel=1
pkgdesc='A barebone deezer downloader library'
arch=(any)
url='https://deemix.app/'
license=('GPL3')
depends=('python>=3.6' 'python-click' 'python-pycryptodomex' 'python-mutagen' 'python-spotipy')
makedepends=('python-setuptools')
source=("https://codeberg.org/RemixDev/deemix/archive/$_commit.tar.gz")
sha256sums=('c3a9dca14d5a5e74bb3da239b75be1c29b5672e2da471e5fbc82854b0da9868c')

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
