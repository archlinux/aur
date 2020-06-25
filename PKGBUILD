# Maintainer: Benjamin Winger <bmw at disroot dot org>

pkgname=portmod-migrate
pkgver=0.1.3
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
sha512sums=('acb34afe9854762ebf2dc022840500a5480b791f8b6c73c36f6e48795ca665f09dbb64a71e15891a4f0670057b05c3b8bf08a22834420612d481176ed62c1fcf')

package() {
  cd "$srcdir/portmodmigrate-v$pkgver"
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python setup.py install --root $pkgdir
}
