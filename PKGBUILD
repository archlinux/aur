# Maintainer: Ben Song <bensongsyz@gmail.com>
pkgname=python-gpiod
_name=${pkgname#python-}
pkgver=1.5.4
pkgrel=1
pkgdesc="gpiod pure Python library with almost the same usage as libgpiodcxx"
arch=("any")
url="https://github.com/hhk7734/python3-gpiod"
license=("MIT")


makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('08f4f6ab602b7d54d1d4e2d6667b32169eb489aa618967a2bf95ac3832c56d577fd235daa9740dd199373179107d0c75d3d12825dec7720a237e79095b460e1b')

build() {
    cd "$srcdir/${_name}-$pkgver"

    python setup.py build
}

package() {
    cd "$srcdir/${_name}-$pkgver"

    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
