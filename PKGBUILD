# Maintainer: Vyacheslav Konovalov <vyachkonovalov@protonmail.com>

_commit=09589f9603096297e2a5b318199bc47b4dfbfafc
pkgname=deemix
pkgver=1.2.15
pkgrel=1
pkgdesc='A barebone deezer downloader library'
arch=(any)
url='https://deemix.app/'
license=('GPL3')
depends=('python>=3.6' 'python-click' 'python-pycryptodomex' 'python-mutagen' 'python-spotipy')
makedepends=('python-setuptools')
source=("https://codeberg.org/RemixDev/deemix/archive/$_commit.tar.gz")
sha256sums=('51838d768a25bd05b1ebd7ef2ec3526521d0af78dc6457e827fa37fc3f4564e4')

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
