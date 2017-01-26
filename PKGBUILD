# Maintainer: Tomislav Ivek <tomislav.ivek@gmail.com>

pkgname=('python-distro')
pkgver=1.0.2
pkgrel=1
pkgdesc="A much more elaborate, renewed alternative implementation for Python's platform.linux_distribution()"
arch=('any')
url="https://github.com/nir0s/distro"
license=('Apache')
makedepends=('python-setuptools')
depends=()
source=(https://github.com/nir0s/distro/archive/v$pkgver.tar.gz)
sha512sums=('bb78f18e95115d4db819af75e3deb1802d80bcec87cadae1f471b9a1b06d4099dce78b6b0b31c42c0e322a9b22e1b03e554b8c1e8c5f3da40423bf7b5e70c340')

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
