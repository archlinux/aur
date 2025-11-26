# Maintainer: Martin Larralde <martin.larralde@embl.de>

_name=gecco
_pyname=gecco
_blake2b=0ff0069c1d8c0935586c61d9c698d66c6e3d7e433f2684801f3af6b7b0660bf9

pkgname=${_name}
pkgver=0.10.1
pkgrel=1
pkgdesc="Gene Cluster prediction with Conditional random fields."
url="https://gecco.embl.de"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=("GPL-3.0-only")
depends=('python' 'python-biopython' 'python-numpy' 'python-polars' 'python-pyhmmer' 'python-pyrodigal' 'python-rich' 'python-rich-argparse' 'python-scikit-learn' 'python-scipy' 'python-sklearn-crfsuite')
makedepends=('python-installer')
optdepends=('python-statsmodels: variable selection with Fisher exact test')
source=("${_pyname}-${pkgver}-py3-none-any.whl::https://files.pythonhosted.org/packages/${_blake2b:0:2}/${_blake2b:2:2}/${_blake2b:4:60}/${_pyname}-${pkgver}-py3-none-any.whl")
sha256sums=(c39d260fea22bb048a1b8fefb55f5e464d836d263b84459b43eeacedaf38d5c4)

package() {
    python -m installer --prefix="${pkgdir}/usr" "${srcdir}/${_pyname}-${pkgver}-py3-none-any.whl"
    #install -Dm644  ${srcdir}/${_pyname}-${pkgver}/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
