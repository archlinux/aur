# Maintainer: Evilchuck666 <carlos.martinez.medina1992@gmail.com>
_pkgname=WinJitsu
pkgname=winjitsu
pkgver=0.1.0
pkgrel=1
pkgdesc="A slick, animated window management tool for Linux (X11)"
arch=('any')
url="https://github.com/Evilchuck666/winjitsu"
license=('GPL3')
depends=('python' 'xdotool' 'xorg-xrandr')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/Evilchuck666/$_pkgname/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('b25920fd0b050b4794d82dd672a66e5d')

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
