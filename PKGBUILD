# Maintainer: Vyacheslav Konovalov <vyachkonovalov@protonmail.com>

_commit=d6a18749c04ea9967b57d080f98c12e71d0a4a46
pkgname=deemix
pkgver=1.5.19
pkgrel=1
pkgdesc='A barebone deezer downloader library'
arch=(any)
url='https://t.me/deemixcommunity'
license=('GPL3')
depends=('python>=3.6' 'python-click' 'python-pycryptodomex' 'python-mutagen' 'python-spotipy'
         'python-eventlet' 'python-dnspython<2.0.0')
makedepends=('python-setuptools')
source=('deemix-src.zip')
sha256sums=('afd875870478069de332c7ce7499cc89dc8306bbec3df2e009ce067c91d0fe3e')

pkgver() {
  sed -En 's/^__version__ = "([0-9\.]+)"$/\1/p' deemix/__init__.py | tr -d '\n'
}

build() {
  touch README.md
  python setup.py build
}

package() {
  python setup.py install --root="$pkgdir" --optimize=1
}
