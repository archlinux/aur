# Maintainer: SanskritFritz (gmail)

pkgname=python-pick
_name=${pkgname#python-}
pkgver=1.0.0
pkgrel=1
pkgdesc="Python library to create interactive selection list in the terminal"
arch=('any')
url="https://github.com/wong2/pick"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/wong2/pick/archive/v$pkgver.tar.gz")
md5sums=('937254e385c8a33bf511741974942eb5')

build() {
    cd $_name-$pkgver
    python setup.py build
}

package() {
    cd $_name-$pkgver
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
