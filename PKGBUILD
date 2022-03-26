# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
# Contributor: Tong Chunli<t.cunly at 163 dot com>
pkgname=python-colcon-zsh
_name=${pkgname:7}
pkgver=0.4.0
pkgrel=1
pkgdesc="An extension for colcon-core to provide zsh scripts."
arch=(any)
url="https://pypi.org/project/colcon-zsh"
license=('Apache')
depends=('python-colcon-core')
makedepends=('python-setuptools')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('555c1b1653f9a97c1acb16fb350042b3cce5d692a13db9a6cbcc3b4de9b94beb')

build() {
    cd ${srcdir}/${_name}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_name}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
