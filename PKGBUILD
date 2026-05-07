# Maintainer: Evilchuck666 <carlos.martinez.medina1992@gmail.com>
_pkgname=WinJitsu
pkgname=winjitsu
pkgver=0.1.0
pkgrel=1
pkgdesc="A slick, animated window management tool for Linux (X11)"
arch=('any')
url="https://github.com/Evilchuck666/winjitsu"
license=('GPL3')
depends=('python' 'xdotool' 'python-xlib')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$_pkgname::git+https://github.com/Evilchuck666/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    python -c "import tomllib; print(tomllib.load(open('pyproject.toml','rb'))['project']['version'])"
}

build() {
    cd "$_pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
