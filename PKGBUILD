# Maintainer: Ivan Lalik <lalikivan02 [at] gmail [dot] com>
_pkgname="AlacrittyTuner"
pkgname=alacrittytuner
pkgver=0.1.0
pkgrel=1
pkgdesc="A CLI tool to reload Alacritty themes and fonts"
arch=('any')
url="https://github.com/Van-02/AlacrittyTuner"
license=('MIT')
depends=('python' 'python-tomlkit')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
provides=('atuner')
conflicts=('atuner')
source=("git+${url}.git")
md5sums=('SKIP')

build() {
  cd "$srcdir/$_pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
