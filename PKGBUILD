# Maintainer: Vyacheslav Konovalov <f4f7l1hvr@relay.firefox.com>

_path=8d/5e/bc67b3df35d182dae2ebdb8d18c3d52fe6a4052d547b009d8354dd34b173
_path=a0/30/7a7f039f7bc5dfb2d2a2a6612285727e241d61eb398d2a0c64b818c307d0
pkgname=deemix
pkgver=2.0.3
pkgrel=1
pkgdesc='A barebone deezer downloader library'
arch=(any)
url='https://t.me/deemixcommunity'
license=('GPL3')
depends=('python>=3.6' 'python-click' 'python-pycryptodomex' 'python-mutagen' 'python-spotipy'
         'python-eventlet' 'python-deezer-py')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/$_path/deemix-$pkgver.tar.gz")
sha256sums=('d9785e6f9c2a148d77820e6726c714b465d320e0d992a16b86b1fe44a0d127ce')

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
