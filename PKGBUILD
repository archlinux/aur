# Maintainer: Bipin Kumar <kbipinkumar@pm.me>

pkgname=nanoqc
_module=nanoQC
pkgver=0.10.0
pkgrel=2
pkgdesc="Create fastQC-like plots for Oxford Nanopore sequencing data"
url="https://github.com/wdecoster/nanoQC"
depends=(
         'python'
         'python-biopython'
         'python-numpy'
         'python-plotly'
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
sha256sums=('5e55b8b244ce7cfb0673fc804f5a0c16dcfc4a03f9aaf84c75b8117d3c3817a6')

build() {
  cd ${_module}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${_module}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
