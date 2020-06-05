# Maintainer: Vyacheslav Konovalov <vyachkonovalov@protonmail.com>

_commit=fd148d481c764a491246d2b51d64e201b897c80e
pkgname=deemix
pkgver=1.0.12
pkgrel=1
pkgdesc='A barebone deezer downloader library'
arch=(any)
url='https://deemix.app/'
license=('GPL3')
depends=('python>=3.6' 'python-click' 'python-pycryptodomex' 'python-mutagen' 'python-spotipy')
makedepends=('python-setuptools')
conflicts=('deemix-git')
source=("https://notabug.org/RemixDev/deemix/archive/$_commit.tar.gz")
sha256sums=('1579b29e1b86fc8c99b1a79ccc748562220f08b7a4181e6fa75a10a8873c57b0')

build() {
  cd deemix
  python setup.py build
}

package() {
  cd deemix
  python setup.py install --root="$pkgdir" --optimize=1
}
