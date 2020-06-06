# Maintainer: Vyacheslav Konovalov <vyachkonovalov@protonmail.com>

_commit=7b7249d3997afd44c2f1cb57fff10f93bf67b230
pkgname=deemix
pkgver=1.0.13
pkgrel=1
pkgdesc='A barebone deezer downloader library'
arch=(any)
url='https://deemix.app/'
license=('GPL3')
depends=('python>=3.6' 'python-click' 'python-pycryptodomex' 'python-mutagen' 'python-spotipy')
makedepends=('python-setuptools')
conflicts=('deemix-git')
source=("https://notabug.org/RemixDev/deemix/archive/$_commit.tar.gz")
sha256sums=('acbcc086b3c7446103cf4d775a4c9ee845db558864b0d2d5263b680bb2b8e925')

build() {
  cd deemix
  python setup.py build
}

package() {
  cd deemix
  python setup.py install --root="$pkgdir" --optimize=1
}
