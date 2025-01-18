# Maintainer: Renato Lui Geh <renatogeh at gmail dot com>

pkgname=cppyy-cling
pkgver=6.32.8
pkgrel=2
pkgdesc="Cling-based Python-C++ bindings (cling backend)"
arch=('x86_64')
url="https://cppyy.readthedocs.io/en/latest/index.html"
license=('LGPLv2+' 'LGPL2.1' 'UoI-NCSA')
depends=('python')
source=("https://files.pythonhosted.org/packages/py2.py3/${pkgname::1}/$pkgname/${pkgname//-/_}-$pkgver-py2.py3-none-manylinux2014_x86_64.whl")
sha256sums=('4c037d874b421a1d6b4c1a94029ea028434ee1038ab8a207d83fec6ddbb1a591')

# Install from wheel, since:
#
#     Wheels are available for the major platforms,
#     but if you have to build from source, building
#     of LLVM will take a long time.
#
# as stated in cppyy's website.
package() {
  python -m installer --destdir="$pkgdir" "${pkgname//-/_}-$pkgver-py2.py3-none-manylinux2014_x86_64.whl"
}
