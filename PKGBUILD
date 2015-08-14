pkgname=python2-rtctree
_name=rtctree
pkgver=4.0.0
pkgrel=1
pkgdesc="API for interacting with running RT-Components and managing RTM-based systems using OpenRTM-aist"
url="https://github.com/gbiggs/rtctree"
depends=('python2' 'openrtm-aist-python')
makedepends=('python2' 'python2-setuptools')
license=('EPLv1.0')
arch=('any')
source=("https://github.com/gbiggs/${_name}/archive/v${pkgver}.tar.gz")
sha256sums=('f955b16ccfab80ad96182e5e95707e011df5dcae0d0f368d0dd18569ed13acc1')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
