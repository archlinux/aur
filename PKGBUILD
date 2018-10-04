# Maintainer: Stephan Springer <buzo+arch@Lini.de>

pkgname=aurblobs
pkgver=0.5.2
pkgrel=1
pkgdesc='Automatically create binary repositories from AUR packages'
arch=('any')
url='https://github.com/aurblobs/aurblobs'
license=('AGPL3')
makedepends=('python-setuptools')
depends=('python-click' 'python-docker' 'python-gitpython' 'git'
         'python-pretty_bad_protocol' 'python-xdg')
source=("$pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('956c429ec30e5606fbd94b8b057129c2b6b6b28bd2a722822a61c683c25bcf12')

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
