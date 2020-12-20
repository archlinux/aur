# Maintainer: Vyacheslav Konovalov <f4f7l1hvr@relay.firefox.com>

_path=d9/2c/1ebd6a264c709993ba4ca593409f98f9ea0938698384138ea7d714d781ad
pkgname=deemix
pkgver=2.0.5
pkgrel=1
pkgdesc='A barebone deezer downloader library'
arch=(any)
url='https://t.me/deemixcommunity'
license=('GPL3')
depends=('python>=3.6' 'python-click' 'python-pycryptodomex' 'python-mutagen' 'python-spotipy'
    'python-eventlet' 'python-deezer-py')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/$_path/deemix-$pkgver.tar.gz")
sha512sums=('5443367f5b1205349d098588d46a68aafdcc10f6cc8303d116a60ec00535b73214bf64d700da9e85ada5a786130f23a05744d9c53c44770d8e878cf8aa84926f')

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
