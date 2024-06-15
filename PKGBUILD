# Maintainer: Bipin Kumar <kbipinkumar@pm.me>

pkgname=nanomath
_module=nanomath
pkgver=1.4.0
pkgrel=1
pkgdesc="simple math function for other Oxford Nanopore processing scripts"
url="https://github.com/wdecoster/nanomath/"
depends=(
         'python'
         'python-pandas'
         'python-numpy'
         'python-deprecated'
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
sha256sums=('ed7a38fbb156d9a68a95c2570fe3c2035321d0a3e234580496750afca4927ced')

build() {
  cd ${pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${pkgname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  rm ${pkgdir}/usr/LICENSE
}
