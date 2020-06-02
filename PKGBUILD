# Maintainer: Vyacheslav Konovalov <vyachkonovalov@protonmail.com>

_commit=b70fcd361c26c6657f94f344e8e26835ddb243c0
pkgname=deemix
pkgver=1.0.11
pkgrel=1
pkgdesc='A barebone deezer downloader library'
arch=(any)
url='https://deemix.app/'
license=('GPL3')
depends=('python>=3.6' 'python-click' 'python-pycryptodomex' 'python-mutagen' 'python-spotipy')
makedepends=('python-setuptools')
conflicts=('deemix-git')
source=("https://notabug.org/RemixDev/deemix/archive/$_commit.tar.gz")
sha256sums=('136aa92f49a97e5cea5c5879c03575d45a15c9efeaf2898dd4cc2c9dff1cda8d')

build() {
  cd deemix
  python setup.py build
}

package() {
  cd deemix
  python setup.py install --root="$pkgdir" --optimize=1
}
