# Maintainer: Benjamin Winger <bmw@disroot.org>

pkgname=portmod
pkgver=2.0_beta4
pkgrel=1
pkgdesc="A cli tool to manage mods for OpenMW"
provides=('portmod')
conflicts=('portmod')
replaces=('openmmm')
arch=(any)
url="https://gitlab.com/portmod/portmod"
license=(GPL3)
depends=("python" "patool" "python-setuptools" "python-colorama" "python-appdirs" "python-black" "python-gitpython"
         "python-yaml" "python-progressbar" "python-restrictedpython" "bubblewrap" "omwcmd" "python-redbaron"
         "python-python-sat" "python-requests" "python-chardet")
makedepends=("python" "python-setuptools" "python-setuptools-scm")
checkdepends=("python-pytest")
optdepends=("omwllf" "tes3cmd" "tr-patcher")
source=("https://gitlab.com/portmod/portmod/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('40546e226557bacea2425bb55658e41fd1429cf720ac49538615303dc1278128af6bec6be897cb8f77ddc6f6c362ac3f90b10d482ad332eb1e805d7e5ac82774')

check() {
  cd "$srcdir/$pkgname-v$pkgver"
  # Disabled check for beta4 due to known bug in test suite
  # SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver pytest
}

package() {
  cd "$srcdir/$pkgname-v$pkgver"
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python setup.py install --root $pkgdir
}
