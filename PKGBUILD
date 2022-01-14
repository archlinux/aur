# Maintainer: Benjamin Winger <bmw@disroot.org>

pkgname=portmod
pkgver=2.2.2
pkgrel=1
pkgdesc="A cli tool to manage mods for OpenMW"
provides=('portmod')
conflicts=('portmod')
replaces=('openmmm')
arch=(any)
url="https://gitlab.com/portmod/portmod"
license=(GPL3)
depends=("python" "patool" "python-setuptools" "python-colorama" "python-appdirs" "python-gitpython"
         "python-progressbar" "python-restrictedpython" "bubblewrap" "python-redbaron"
         "python-python-sat" "python-requests" "python-chardet" "python-fasteners")
makedepends=("python" "python-setuptools" "python-setuptools-scm" "rust" "python-setuptools-rust" "python-packaging")
checkdepends=("python-pytest")
optdepends=("omwllf" "tes3cmd" "tr-patcher" "python-argcomplete")
source=("https://gitlab.com/portmod/portmod/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('6dde275df424ba02221b635c3e570dd7dde8402b66889524d731de009656749168b9fde8e36c6520ec5ddc661defe38d33d230063a5ad42b840fefb8ca0c65ba')

build() {
  cd "$srcdir/$pkgname-v$pkgver"
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python setup.py build
}

# check() {
#   cd "$srcdir/$pkgname-v$pkgver"
#   SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver pytest
# }

package() {
  cd "$srcdir/$pkgname-v$pkgver"
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python setup.py install --root $pkgdir
}
