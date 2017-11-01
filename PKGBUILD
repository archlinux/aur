# Maintainer: Santiago Torres-Arias <santiago@archlinux.org>
# Contributor: kpcyrd <git@rxv.cc>

pkgbase=reprotest
pkgname=('reprotest')
pkgver=0.7.3
pkgrel=1
pkgdesc="Run a process twice and check the output for reproducibility"
arch=('any')
license=('GPL2' 'GPL3')
url="https://anonscm.debian.org/cgit/reproducible/reprotest.git/"
provides=("reprotest=$pkgver")
depends=('python' 'python-rstr' 'diffoscope' 'fakeroot')
optdepends=('disorderfs>=0.5.2' 'python-progressbar>=3.34.3-1')
makedepends=('python' 'python-setuptools')
source=("http://reproducible.alioth.debian.org/releases/reprotest/${pkgname}_${pkgver}.tar.xz")
sha512sums=('854572e18334d319e4c290b5751daf7fe3bac07e5913c528a8f23f2c9c5dcefb812f2248f98d4785cf936741fa051ea6e19b7445fd75d582b5c977b119a4604a')

build() {
  cd "$srcdir/reprotest"
  python setup.py build
}

package() {
  depends=('python' 'python-setuptools')
  cd "$srcdir/reprotest"
  python setup.py install --root="$pkgdir" --optimize=1
}
