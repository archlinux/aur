# Maintainer: Popolon <popolon@popolon.org>

pkgbase='python-inkex'
pkgname=('python-inkex')
_module='inkex'
pkgver='1.3.0'
pkgrel=1
pkgdesc="Python extensions for Inkscape core, separated out from main repository."
url="https://gitlab.com/inkscape/extensions"
depends=('python')
makedepends=('python-setuptools')
license=('GPL')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/${_module/-/_}-$pkgver.tar.gz")
sha256sums=('7f41aba0cc2ad1f205c8f231a11bb2d881874bb7ec186d79b53200a07f459928')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
