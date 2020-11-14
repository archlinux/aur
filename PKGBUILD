# Maintainer: Vyacheslav Konovalov <vyachkonovalov@protonmail.com>

_commit=13f6eab17231b99abe33ff37cd309545f01729a9
pkgname=deemix
pkgver=1.5.20
pkgrel=1
pkgdesc='A barebone deezer downloader library'
arch=(any)
url='https://t.me/deemixcommunity'
license=('GPL3')
depends=('python>=3.6' 'python-click' 'python-pycryptodomex' 'python-mutagen' 'python-spotipy'
         'python-eventlet' 'python-dnspython<2.0.0')
makedepends=('python-setuptools')
source=("https://notabug.org/RemixDev/deemix/archive/$_commit.tar.gz")
sha256sums=('789fa6a825716d0daef294fa1f70d0f992ec9b13817d4e3e0b81d60a9cd2e47b')

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
