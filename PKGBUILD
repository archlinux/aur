# Maintainer: mike2208

pkgbase='python-ovs'
pkgname=('python-ovs')
pkgver=2.7.0
pkgrel=0
pkgdesc="zip archive generator for streaming purposes"
arch=(any)
url="https://github.com/openvswitch/ovs"
license=('Apache2')
groups=()
depends=()
makedepends=('python-setuptools')
options=(!emptydirs)
source=("${pkgbase}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
md5sums=('90c534ffe03736623e4d976a2e378615')
sha256sums=('e660f4aa9a7e3ec9da525a51ab9d654c651f7a2b16f297f18eeba9117db4625e')

package_python-ovs() {
      cd "$srcdir/ovs-${pkgver}"
      ./boot.sh
      ./configure --prefix="$pkgdir/usr" --localstatedir="$pkgdir/var" --sysconfdir="$pkgdir/etc"
      make python/ovs/version.py

      cd "$srcdir/ovs-${pkgver}/python"
      python setup.py install --root="$pkgdir/" --optimize=1
    }
# vim:set ts=2 sw=2 et:
