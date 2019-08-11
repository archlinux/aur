# Maintainer: Benjamin Winger <bmw@disroot.org>

pkgname=portmod
pkgver=2.0_alpha2
pkgrel=1
pkgdesc="A cli tool to manage mods for OpenMW"
provides=('portmod')
conflicts=('portmod')
replaces=('openmmm')
arch=(any)
url="https://gitlab.com/portmod/portmod"
license=(GPL3)
depends=("python" "patool" "python-setuptools" "python-colorama" "python-appdirs" "python-black" "python-gitpython"
         "python-yaml" "python-progressbar" "python-restrictedpython" "bubblewrap" "omwcmd")
makedepends=("python" "python-setuptools" "python-setuptools-scm")
checkdepends=("python-pytest")
optdepends=("omwllf")
source=("https://gitlab.com/portmod/portmod/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('6a2b60f0f4f2dce35b0a5182a25adeafffc89c6bf65b0d07b6d349f2568ed096cc6c30cb2f1a0132cf5b006e8de7c31f69e08064b9b3a8ba9c94c2c792bd2956')

check() {
  cd "$srcdir/$pkgname-v$pkgver"
  python setup.py test
}

package() {
  cd "$srcdir/$pkgname-v$pkgver"
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python setup.py install --root $pkgdir
}
