# Maintainer: Tomislav Ivek <tomislav.ivek@gmail.com>

pkgname=('python-distro')
pkgver=1.0.4
pkgrel=1
pkgdesc="A much more elaborate, renewed alternative implementation for Python's platform.linux_distribution()"
arch=('any')
url="https://github.com/nir0s/distro"
license=('Apache')
makedepends=('python-setuptools')
depends=()
source=(https://github.com/nir0s/distro/archive/v$pkgver.tar.gz)
sha512sums=('117d44ff8145231e2ad7e2641c87c61d42804b84935a5d694ef4b57cdd220b336a86320c5073d2675cb6064b9285123fbea9601d644f94b4a139b7524e09faa8')

build() {
  cd "$srcdir/distro-$pkgver"
  python setup.py build
}

package_python-distro() {
  cd "$srcdir/distro-$pkgver"
  python setup.py install --optimize=1 --root=${pkgdir}
  install -m755 -d "${pkgdir}/usr/share/licenses/python-distro"
  install -m644 LICENSE "${pkgdir}/usr/share/licenses/python-distro/"
}
