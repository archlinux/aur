# Maintainer: Vyacheslav Konovalov <f4f7l1hvr@relay.firefox.com>

_commit=67fcb7d37f0cd24564b7ff2738cd5e69551edc6d
pkgname=deemix
pkgver=2.0.16
pkgrel=2
pkgdesc='A deezer downloader built from the ashes of Deezloader Remix'
arch=(any)
url='https://git.freezer.life/RemixDev/deemix-py'
license=('GPL3')
depends=(
    'python>=3.6' 'python-click' 'python-pycryptodomex' 'python-mutagen'
    'python-spotipy' 'python-eventlet' 'python-deezer-py'
)
makedepends=('python-setuptools')
source=("https://git.freezer.life/RemixDev/deemix-py/archive/$_commit.tar.gz")
sha512sums=('51a5b5536ebfa3cc25b8a5757f3b680d5a61a210b58eed0a45bd4408cc5b083d8bd64459d433b60526cceb86f827613f7e7d320f91e9630a9ef370280bab8540')

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
