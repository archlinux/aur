pkgname=python2-rtctree
_name=rtctree
pkgver=3.0.1
pkgrel=1
pkgdesc="API for interacting with running RT-Components and managing RTM-based systems using OpenRTM-aist"
url="https://github.com/gbiggs/rtctree"
depends=('python2' 'openrtm-aist-python')
makedepends=('python2' 'python2-setuptools')
license=('EPLv1.0')
arch=('any')
source=("https://github.com/gbiggs/${_name}/archive/v${pkgver}.tar.gz")
md5sums=('224d6e3d76446111e7628e7f53a8d55f')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
