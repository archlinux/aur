# Maintainer: Hyacinthe Cartiaux <hyacinthe dot cartiaux at free dot fr>
# Contributor: Aniket-Pradhan aniket17133@iiitd.ac.in
# Contributor: Valentin Lab valentin.lab@kalysto.org

_pkgname=gitchangelog
pkgname=python-gitchangelog
pkgver=3.2.2
pkgrel=1
pkgdesc="Creates a changelog from git log history."
url="https://github.com/sarnold/gitchangelog"
license=("BSD")
depends=('python')
optdepends=('python-pystache' 'python-mako')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm' 'python-wheel')
arch=("x86_64")
source=("https://github.com/sarnold/gitchangelog/releases/download/${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('08c863fd91447ab58e64e50e787ee7f0f3d2f2184369fe4f7ae3d8fda8ce1632')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

