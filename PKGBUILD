pkgname='python-eviltransform'
pkgver=0.1.1
pkgrel=1
pkgdesc="Transform coordinates between earth(WGS-84) and mars in china(GCJ-02)."
url="https://github.com/googollee/eviltransform"
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('unknown')
arch=('any')
source=("https://files.pythonhosted.org/packages/e7/a2/d48e4513355c92a3207ff2a855d5eb840b15d9e8d93e7ead0f27be1df104/eviltransform-0.1.1.tar.gz")
sha256sums=('e49c287a7ce5f5d9244e9420627fe33d020666d632ad4aee0f5ab530f70e1306')

build() {
    cd "${srcdir}/eviltransform-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/eviltransform-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
