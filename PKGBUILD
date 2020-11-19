# Maintainer: Vyacheslav Konovalov <vyachkonovalov@protonmail.com>

_path=a9/59/07c16836f593a0993f725ab9230a2af43599935ad1151c45229fcfdc90f3
pkgname=deemix
pkgver=1.5.20
pkgrel=2
pkgdesc='A barebone deezer downloader library'
arch=(any)
url='https://t.me/deemixcommunity'
license=('GPL3')
depends=('python>=3.6' 'python-click' 'python-pycryptodomex' 'python-mutagen' 'python-spotipy'
         'python-eventlet' 'python-dnspython')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/$_path/deemix-$pkgver.tar.gz")
sha256sums=('a6c9a330e62d37b78bf7411089a63facbafc19ac3c7fb5634c03896d5c3db6fd')

pkgver() {
  cd deemix-$pkgver
  sed -En 's/^__version__ = "([0-9\.]+)"$/\1/p' deemix/__init__.py | tr -d '\n'
}

build() {
  cd deemix-$pkgver
  python setup.py build
}

package() {
  cd deemix-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
