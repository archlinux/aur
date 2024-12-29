# Maintainer: kbipinkumar <kbipinkumar@pm.me>

_pkg=mslex
pkgname=python-${_pkg}
pkgver=1.3.0
pkgrel=2
pkgdesc="shlex package for windows shell quoting"
arch=("any")
url="https://github.com/smoofra/mslex"
license=('Apache-2.0')
depends=('python')
makedepends=('python-pip'
             'python-wheel'
             'python-watchdog'
             'flake8'
             'python-flake8-black'
             'python-tox'
             'python-coverage'
             'python-sphinx'
             'twine'
             'python-black'
             'python-pytest'
             'python-types-setuptools'
             'python-build'
             'python-pip'
             'python-setuptools'
             'python-installer'
             'python-trio'
             'python-tqdm'
             'git'
            )

_tag=v${pkgver}
source=("${_pkg}::git+https://github.com/smoofra/mslex.git#tag=${_tag}")
sha256sums=('e60752c7f2229bf551890ee017feb3949a6a32e93cc114e045c55330fe849c44')

build() {
    cd ${_pkg}
    python -m build --wheel --no-isolation
}

package() {
    cd ${_pkg}
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
