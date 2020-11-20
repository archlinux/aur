# Maintainer: Vyacheslav Konovalov <vyachkonovalov@protonmail.com>

_path=8d/5e/bc67b3df35d182dae2ebdb8d18c3d52fe6a4052d547b009d8354dd34b173
pkgname=deemix
pkgver=2.0.1
pkgrel=1
pkgdesc='A barebone deezer downloader library'
arch=(any)
url='https://t.me/deemixcommunity'
license=('GPL3')
depends=('python>=3.6' 'python-click' 'python-pycryptodomex' 'python-mutagen' 'python-spotipy'
         'python-eventlet' 'python-deezer-py')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/$_path/deemix-$pkgver.tar.gz")
sha256sums=('47cb8abeb6ddb7566b1945119a653a51f551d2c279ef255b5abb716fbf1aa350')

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
