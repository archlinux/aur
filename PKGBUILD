pkgname=python2-rtctree
_name=rtctree
pkgver=4.1.0
pkgrel=1
pkgdesc="API for interacting with running RT-Components and managing RTM-based systems using OpenRTM-aist"
url="https://github.com/gbiggs/rtctree"
depends=('python2' 'openrtm-aist-python')
makedepends=('python2' 'python2-setuptools')
license=('EPLv1.0')
arch=('any')
source=("https://github.com/gbiggs/${_name}/archive/v${pkgver}.tar.gz")
sha256sums=('9abf478bb098636e37fcbd363f926db23d5b6886f8fd657c5b1902916294361b')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
