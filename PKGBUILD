# Maintainer: Vyacheslav Konovalov <vyachkonovalov@protonmail.com>

_commit=1de7d1d2205935808ae1335293fe25885cddaa4d
pkgname=deemix
pkgver=1.2.13
pkgrel=1
pkgdesc='A barebone deezer downloader library'
arch=(any)
url='https://deemix.app/'
license=('GPL3')
depends=('python>=3.6' 'python-click' 'python-pycryptodomex' 'python-mutagen' 'python-spotipy')
makedepends=('python-setuptools')
source=("https://codeberg.org/RemixDev/deemix/archive/$_commit.tar.gz")
sha256sums=('1db3796aefb71bc216a2df4de6922947f3aab25b248d5968a651b682ba594a47')

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
