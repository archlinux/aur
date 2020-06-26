# Maintainer: Vyacheslav Konovalov <vyachkonovalov@protonmail.com>

_commit=d628eb39e3967bc63272e9c469b3de58bb80178b
pkgname=deemix
pkgver=1.1.0
pkgrel=1
pkgdesc='A barebone deezer downloader library'
arch=(any)
url='https://deemix.app/'
license=('GPL3')
depends=('python>=3.6' 'python-click' 'python-pycryptodomex' 'python-mutagen' 'python-spotipy')
makedepends=('python-setuptools')
conflicts=('deemix-git')
source=("https://notabug.org/RemixDev/deemix/archive/$_commit.tar.gz")
sha256sums=('f2fa56dda0bb18c35084a37f93bea01cd2d88818adf3971a07fff8c0bbf461b4')

build() {
  cd deemix
  python setup.py build
}

package() {
  cd deemix
  python setup.py install --root="$pkgdir" --optimize=1
}
