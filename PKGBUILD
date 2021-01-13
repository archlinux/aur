# Maintainer: Vyacheslav Konovalov <f4f7l1hvr@relay.firefox.com>

_path=83/69/d6cb3246b9b0964dc90287b0692db0c578342f6a0e8c1a31cba5ea48dda9
pkgname=deemix
pkgver=2.0.11
pkgrel=1
pkgdesc='A barebone deezer downloader library'
arch=(any)
url='https://t.me/deemixcommunity'
license=('GPL3')
depends=('python>=3.6' 'python-click' 'python-pycryptodomex' 'python-mutagen' 'python-spotipy'
    'python-eventlet' 'python-deezer-py')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/$_path/deemix-$pkgver.tar.gz")
sha512sums=('0f352c13f2d6c18e19aa4b6ac3e4f3d2862cf54771de591fc7bbc31818807a8bdba607721a9941ebc57c04dec9c6c6bd12b36f812c272ed0b4a434c35a4ba1c2')

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
