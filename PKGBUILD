# Maintainer: Ben Song <bensongsyz@gmail.com>
pkgname=python-gpiod
_name=${pkgname#python-}
pkgver=1.5.0
pkgrel=1
pkgdesc="gpiod pure Python library with almost the same usage as libgpiodcxx"
arch=("any")
url="https://github.com/hhk7734/python3-gpiod"
license=("MIT")


makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('cdda2e8316278f7a0c257351aeb682bc90d27ff8c45bd3fbb0c37859f7075f48334d60d9fbb7bd064f87f5b4b911fd0f14ea4f7dc2198cf845da5d2baebab9c4')

build() {
    cd "$srcdir/${_name}-$pkgver"

    python setup.py build
}

package() {
    cd "$srcdir/${_name}-$pkgver"

    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
