# Maintainer: Franck Lucien Duriez <franck.lucien.duriez@gmail.com>
pkgname="python2-xunitparser"
_srcname="python-xunitparser"
pkgver="1.3.3"
pkgrel="1"
pkgdesc="Read JUnit/XUnit XML files and map them to Python objects."
arch=('any')
url="http://git.p.engu.in/laurentb/xunitparser/"
license=('LGPL')
depends=('python2')
makedepends=('python2-setuptools')
source=("https://pypi.python.org/packages/57/04/15064f68aea845109382e966ea059497bcbf006b2ef0dee0e602065e09ce/xunitparser-1.3.3.tar.gz")
md5sums=('2b7f5cb8b951d082b1ee09c7d7b7de1d')

prepare() {
  #cd "${srcdir}/${_srcname}-${pkgver}"
  echo ""

  # No need for enum-compat if depend on enum34
  #sed -i "s/'enum-compat',//" setup.py
}

package() {
  cd "${srcdir}/xunitparser-${pkgver}"
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

