# Maintainer: Benjamin Winger <bmw at disroot dot org>

pkgname=portmod-migrate
pkgver=0.2.0
pkgrel=1
pkgdesc="A tool to help migrate from manually installed OpenMW mods to Portmod"
provides=('portmod-migrate')
conflicts=('portmod-migrate')
arch=(any)
url="https://gitlab.com/portmod/portmodmigrate"
license=(GPL3)
depends=("python" "portmod" "python-fuzzywuzzy")
makedepends=("python" "python-setuptools" "python-setuptools-scm")
source=("https://gitlab.com/portmod/portmodmigrate/-/archive/v$pkgver/portmodmigrate-v$pkgver.tar.gz")
sha512sums=('30a0ea839bcf280149ce9a523053e30c94763812931839a4f4a2835b4a947853ade07c79cf3fe4ce670c0a287e4d1a7d0182aadbcb089a588099880f494c6bf7')

package() {
  cd "$srcdir/portmodmigrate-v$pkgver"
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python setup.py install --root $pkgdir
}
