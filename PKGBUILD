# Maintainer: Benjamin Winger <bmw@disroot.org>

pkgname=portmod
pkgver=2.0_beta2
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
         "python-python-sat" "python-requests")
makedepends=("python" "python-setuptools" "python-setuptools-scm")
checkdepends=("python-pytest")
optdepends=("omwllf" "tes3cmd" "tr-patcher")
source=("https://gitlab.com/portmod/portmod/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('f452796d964cbb91127d26237b8576b0f0907ca387634dd09d544bab7f0ae72ffccd6e02897db233ef77d5affcd2f710e36e41a8574923657a6b8f56900d6360')

check() {
  cd "$srcdir/$pkgname-v$pkgver"
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver pytest
}

package() {
  cd "$srcdir/$pkgname-v$pkgver"
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python setup.py install --root $pkgdir
}
