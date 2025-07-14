pkgname=python-ocp-tessellate
_name=ocp_tessellate
pkgdesc="Tessellate OCP objectsto use with threejs"
pkgver=3.0.14
pkgrel=1
arch=('any')
url="https://github.com/bernhard-42/ocp-tessellate"
license=('Apache-2.0')
depends=('python-webcolors' 'python-numpy' 'python-cachetools' 'python-imagesize')
makedepends=('python-build' 'python-installer' 'python-wheel')
#checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/o/$_name/$_name-$pkgver.tar.gz")
sha256sums=('b3723de85fd412df262b7fe67119004999f1e1662feb622c7dd83cf22ba0453e')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}

# some tests depend on ocp_vscode, which would create a cyclic dependency...
#check() {
#    cd $_name-$pkgver
#    pytest
#}
