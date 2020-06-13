# Maintainer: Vyacheslav Konovalov <vyachkonovalov@protonmail.com>

_commit=aac20fbc027929c9dbd3f984a2611bfcac0a1879
pkgname=deemix
pkgver=1.0.20
pkgrel=1
pkgdesc='A barebone deezer downloader library'
arch=(any)
url='https://deemix.app/'
license=('GPL3')
depends=('python>=3.6' 'python-click' 'python-pycryptodomex' 'python-mutagen' 'python-spotipy')
makedepends=('python-setuptools')
conflicts=('deemix-git')
source=("https://notabug.org/RemixDev/deemix/archive/$_commit.tar.gz")
sha256sums=('61a408cbf9eece422d4377b8207069b8a4f3d11aa1c02be7e746d81046cac0c4')

build() {
  cd deemix
  python setup.py build
}

package() {
  cd deemix
  python setup.py install --root="$pkgdir" --optimize=1
}
