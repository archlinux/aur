# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

_commit=d2e0450ace31cc6b23380fbce85ea47053450a27
pkgname=deemix
pkgver=3.5.3
pkgrel=1
pkgdesc='A barebone deezer downloader library'
arch=(any)
url='https://git.freezer.life/RemixDev/deemix-py'
license=('GPL3')
depends=(
    'python>=3.6' 'python-click' 'python-pycryptodomex' 'python-mutagen'
    'python-spotipy' 'python-eventlet' 'python-deezer-py>=1.0.0'
)
makedepends=('python-setuptools')
source=("https://git.freezer.life/RemixDev/deemix-py/archive/$_commit.tar.gz")
sha512sums=('20ed3cbf0c9cb91bf7bf4c5cacb21999d60d72839b102fcab0ce30ea4ea2e7b2e1638869f7a979b95f6f1055f634cd49df0318b44021a6161f17621b9f935c29')

pkgver() {
    cd deemix-py
    sed -En 's/^__version__ = "([0-9\.]+)"$/\1/p' deemix/__init__.py | tr -d '\n'
}

build() {
    cd deemix-py
    python setup.py build
}

package() {
    cd deemix-py
    python setup.py install --root="$pkgdir" --optimize=1
}
