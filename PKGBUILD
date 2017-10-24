# Maintainer: Franck Lucien Duriez <franck.lucien.duriez@gmail.com>
pkgname="python2-junit-xml"
_srcname="python-junit-xml"
pkgver="1.0"
pkgrel="1"
pkgdesc="Creates JUnit XML test result documents that can be read by tools such as Jenkins."
arch=('any')
license=('LGPL')
depends=('python2')
makedepends=('python2-setuptools')
source=("https://pypi.python.org/packages/63/34/995c6f062e813f52ba42e82f3d21a8f25fbdf375cede1bfbf36112636ca0/junit-xml-1.0.tar.gz")
md5sums=('b4b6f2d9a247bd50bd0246ce014ef8f3')

prepare() {
  #cd "${srcdir}/${_srcname}-${pkgver}"
  echo ""

  # No need for enum-compat if depend on enum34
  #sed -i "s/'enum-compat',//" setup.py
}

package() {
  cd "${srcdir}/junit-xml-${pkgver}"
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

