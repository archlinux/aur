pkgname=python-ocp-tessellate
_name=ocp_tessellate
pkgdesc="Tessellate OCP objectsto use with threejs"
pkgver=3.0.10
pkgrel=1
arch=('any')
url="https://github.com/bernhard-42/ocp-tessellate"
license=('Apache-2.0')
depends=('python-webcolors' 'python-numpy' 'python-cachetools' 'python-imagesize')
makedepends=('python-build' 'python-installer' 'python-wheel')
#checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/o/$_name/$_name-$pkgver.tar.gz")
sha256sums=('f3b00d8e90f9bfd27f70f85760199e54d625f1c28805944ecd1a386ebc08ab41')

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
