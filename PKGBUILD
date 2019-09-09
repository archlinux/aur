# Maintainer: Benjamin Winger <bmw@disroot.org>

pkgname=portmod
pkgver=2.0_alpha3
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
sha512sums=('bca7397b8fb8b56fb88ba04e397ffc6b2e6c4896759229415c5374f36d7f84197fb7d7119637e8f6da06ee748b7eeae3cf41f8d57a17f4870f9dda3efd891f1c')

check() {
  cd "$srcdir/$pkgname-v$pkgver"
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python setup.py test
}

package() {
  cd "$srcdir/$pkgname-v$pkgver"
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python setup.py install --root $pkgdir
}
