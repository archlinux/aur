# Maintainer:cqzw555 < cqzw555@163.com >

_name=swig
pkgname=python-$_name
pkgver=4.2.1
pkgrel=2
pkgdesc="SWIG is a software development tool that connects programs written in C and C++ with a variety of high-level programming languages."
url="https://github.com/nightlark/swig-pypi"
license=('Apache-2.0' 'GPL-3.0-only')
arch=('x86_64' 'aarch64' 'i686')
makedepends=('python-installer' 'python-build' 'python-scikit-build' 'm4' 'python-setuptools-scm')
depends=('python')
conflicts=("swig")
source=("https://files.pythonhosted.org/packages/source/s/$_name/$_name-$pkgver.tar.gz")
sha256sums=("cdbb1748132ce99defaf4ebf1736c457fb13788183264af28f17d0d477e109ba")

build(){
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
