# Maintainer: Vyacheslav Konovalov <vyachkonovalov@protonmail.com>

_commit=8218cbb5e144f9f5769f0129acb7c74111ce3206
pkgname=deemix
pkgver=1.0.14
pkgrel=1
pkgdesc='A barebone deezer downloader library'
arch=(any)
url='https://deemix.app/'
license=('GPL3')
depends=('python>=3.6' 'python-click' 'python-pycryptodomex' 'python-mutagen' 'python-spotipy')
makedepends=('python-setuptools')
conflicts=('deemix-git')
source=("https://notabug.org/RemixDev/deemix/archive/$_commit.tar.gz")
sha256sums=('3058ffa4359908ce6e0db7eec199cb97fde5c3a6f7b51f2cb1a4bda74bb860c6')

build() {
  cd deemix
  python setup.py build
}

package() {
  cd deemix
  python setup.py install --root="$pkgdir" --optimize=1
}
