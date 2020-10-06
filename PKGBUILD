# Maintainer: Vyacheslav Konovalov <vyachkonovalov@protonmail.com>

_commit=a3b96d334017265c7ce3ef0833bbb082d5f99677
pkgname=deemix
pkgver=1.5.9
pkgrel=1
pkgdesc='A barebone deezer downloader library'
arch=(any)
url='https://deemix.app/'
license=('GPL3')
depends=('python>=3.6' 'python-click' 'python-pycryptodomex' 'python-mutagen' 'python-spotipy'
         'python-eventlet')
makedepends=('python-setuptools')
source=("https://codeberg.org/RemixDev/deemix/archive/$_commit.tar.gz")
sha256sums=('01cf9e8a7abaeebc8b149a74ca722d874fea83fbaabe35c7e16913c397d04c02')

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
