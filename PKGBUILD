# Maintainer: Vyacheslav Konovalov <vyachkonovalov@protonmail.com>

_commit=c8875483bc132632ef35efb1b43289cd1ff6315d
pkgname=deemix
pkgver=1.0.22
pkgrel=1
pkgdesc='A barebone deezer downloader library'
arch=(any)
url='https://deemix.app/'
license=('GPL3')
depends=('python>=3.6' 'python-click' 'python-pycryptodomex' 'python-mutagen' 'python-spotipy')
makedepends=('python-setuptools')
conflicts=('deemix-git')
source=("https://notabug.org/RemixDev/deemix/archive/$_commit.tar.gz")
sha256sums=('8fb7d17bef8b2523f4e50512827e5fed57f8d26aa19ac9a2f56441d01d79117e')

build() {
  cd deemix
  python setup.py build
}

package() {
  cd deemix
  python setup.py install --root="$pkgdir" --optimize=1
}
