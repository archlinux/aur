# Maintainer: mattski <redmattski at gmail dot com>

pkgname=python-audible-series
_name=${pkgname#python-}
pkgver=1.0.2
pkgrel=2
pkgdesc='Adds a command to audible-cli that looks for new series releases in a user'"'"'s library.'
arch=(any)
url=https://github.com/luscoma/audible-series
license=(APACHE)
depends=(python python-audible python-yaml)
makedepends=('python-build' 'python-installer' 'python-wheel')
checkdepends=()
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('c634b465788ec995bf734f6f337343c2e327a80f6f11c6a66b367129cea35ad0')

build() {
    cd $srcdir/${_name}-$pkgver
    python -m build --wheel --no-isolation
}
package() {
    cd $srcdir/${_name}-$pkgver
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

