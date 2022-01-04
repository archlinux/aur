# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

_commit=203ec1f10f0d44ded00ec220a8c621f1aa8237b1
pkgname=deemix
pkgver=3.6.5
pkgrel=1
pkgdesc='A barebone deezer downloader library'
arch=(any)
url='https://git.freezerapp.xyz/RemixDev/deemix-py'
license=('GPL3')
depends=(
    'python>=3.6' 'python-click' 'python-pycryptodomex' 'python-mutagen'
    'python-spotipy' 'python-eventlet' 'python-deezer-py>=1.0.0'
)
makedepends=('python-setuptools')
source=("deemix.tar.gz::https://git.freezerapp.xyz/RemixDev/deemix-py/archive/$_commit.tar.gz")
sha512sums=('68a3e5dd8c1bfc2f4c5161787b565d099fec494e7bbd973f68daa2d2047724fcaec3279c4c11dac08eb8b22c877cbf11aaccd2302f659cd8b5be044b4e8041cf')

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
