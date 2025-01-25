# Maintainer: dringsim <dringsim@qq.com>

pkgname=python-sparqlkernel
_name=${pkgname#python-}
pkgver=1.3.0
pkgrel=1
pkgdesc="A Jupyter kernel for SPARQL queries"
arch=('any')
url="https://github.com/paulovn/sparql-kernel"
license=('BSD-3-Clause')
makedepends=('python-build' 'python-installer' 'python-wheel')
depends=('jupyter-notebook' 'python-traitlets' 'python-rdflib' 'python-pygments' 'python-sparqlwrapper')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('fdaa990dccd7b4d6153876d842f6b78c97786e429a474770bf9695e8ad109b00')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
