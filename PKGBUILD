# Maintainer: Benjamin Winger <bmw@disroot.org>

pkgname=portmod
pkgver=2.0_alpha6
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
optdepends=("omwllf" "tes3cmd" "tr-patcher")
source=("https://gitlab.com/portmod/portmod/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('cc9e53d48d6536a84f6785f0edf4a40401ed30a38d07ed8626a2048d7b51769f172655938160a52ff9197511128e2faecd15d08ebde0bd6b316b98ce3fb4dba8')

check() {
  cd "$srcdir/$pkgname-v$pkgver"
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python setup.py test
}

package() {
  cd "$srcdir/$pkgname-v$pkgver"
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python setup.py install --root $pkgdir
}
