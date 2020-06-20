# Maintainer: Vyacheslav Konovalov <vyachkonovalov@protonmail.com>

_commit=ffeb9d2ace6129c47d161e4564deba2ab8db93b8
pkgname=deemix
pkgver=1.0.24
pkgrel=1
pkgdesc='A barebone deezer downloader library'
arch=(any)
url='https://deemix.app/'
license=('GPL3')
depends=('python>=3.6' 'python-click' 'python-pycryptodomex' 'python-mutagen' 'python-spotipy')
makedepends=('python-setuptools')
conflicts=('deemix-git')
source=("https://notabug.org/RemixDev/deemix/archive/$_commit.tar.gz")
sha256sums=('414afb618e7c15d59fd14a63f1693eb3fb524767382dfa9e266bf478c08f4832')

build() {
  cd deemix
  python setup.py build
}

package() {
  cd deemix
  python setup.py install --root="$pkgdir" --optimize=1
}
