# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

_commit=01bcd9ce379b76ab8f84ec5aaba98e18ec0296cf
pkgname=deemix
pkgver=3.4.2
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
sha512sums=('bc234b4974c6387305ee65b8ab861f55b82adb94c0f93d46f5dd12b072472c487448f24ebd7688eac4230d9904318278e4d2db3b61533c6cddf6a317943e9883')

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
