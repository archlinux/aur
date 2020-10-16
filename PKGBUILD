# Maintainer: Vyacheslav Konovalov <vyachkonovalov@protonmail.com>

_commit=a7b779072e5a6eb24c49af2465087f5f4657755f
pkgname=deemix
pkgver=1.5.17
pkgrel=1
pkgdesc='A barebone deezer downloader library'
arch=(any)
url='https://deemix.app/'
license=('GPL3')
depends=('python>=3.6' 'python-click' 'python-pycryptodomex' 'python-mutagen' 'python-spotipy'
         'python-eventlet' 'python-dnspython<2.0.0')
makedepends=('python-setuptools')
source=("https://codeberg.org/RemixDev/deemix/archive/$_commit.tar.gz")
sha256sums=('2247a3204072ea773c482c85aac4e1c662615b08520e8aec441a0f501ec3b7be')

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
