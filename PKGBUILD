# Maintainer: Bipin Kumar <kbipinkumar@pm.me>

pkgname=nanoqc
_module=nanoQC
pkgver=0.9.4
pkgrel=1
pkgdesc="Create fastQC-like plots for Oxford Nanopore sequencing data"
url="https://github.com/wdecoster/nanoQC"
depends=(
         'python'
         'python-biopython'
         'python-numpy'
         'python-bokeh'
        )

makedepends=(
             'python-setuptools'
             'python-wheel'
             'python-build'
             'cython'
             'python-installer'
            )
license=('GPL3')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('05685656138cbaf099b18831d1ceeaca93faf3399881cc2efda44c04d3b316e3')

build() {
  cd ${_module}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${_module}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
