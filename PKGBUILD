# Maintainer: Benoît Allard <benoit.allard@gnx.de>
pkgname=python-file-read-backwards
pkgver=2.0.0
pkgrel=1
pkgdesc="Memory efficient way of reading files line-by-line from the end of file"
arch=('any')
url="https://github.com/RobinNil/file_read_backwards"
license=('MIT')
depends=("python")
_name=${pkgname#python-}
source=("$pkgname-$pkgver.tar.gz::https://github.com/RobinNil/${_name//-/_}/archive/v$pkgver.tar.gz")
md5sums=('38ee664ca2083ecf59fd09f4211c5406')

build() {
    cd ${_name//-/_}-$pkgver
    export PYTHONSEED=1
    python setup.py build
}

package() {
    cd ${_name//-/_}-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
