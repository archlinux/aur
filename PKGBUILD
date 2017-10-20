# Maintainer: Santiago Torres-Arias <santiago@archlinux.org>

pkgbase=reprotest
pkgname=('reprotest')
pkgver=0.7.2
pkgrel=2
pkgdesc="Run a process twice and check the output for reproducibility"
arch=('any')
license=('GPL2' 'GPL3')
url="https://anonscm.debian.org/cgit/reproducible/reprotest.git/"
provides=("reprotest=$pkgver")
depends=('diffoscope' 'fakeroot')
optdepends=('disorderfs>=0.5.2' 'python-progressbar>=3.34.3-1')
makedepends=('python' 'python-setuptools')
source=("http://reproducible.alioth.debian.org/releases/reprotest/${pkgname}_${pkgver}.tar.xz")
sha512sums=('4b2a6ab63b91d08086acb666d045c646bdb51005a491bff64d6384cd04255ee9114cfde6963a9ced966c6a20b7cf4004a88e6f5f1fa8772b7b4d27b18c8182bb')

build() {
  cd "$srcdir/reprotest"
  python setup.py build
}

package() {
  depends=('python' 'python-setuptools')
  cd "$srcdir/reprotest"
  python setup.py install --root="$pkgdir" --optimize=1
}
