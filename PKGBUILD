# Maintainer: Benjamin Winger <bmw@disroot.org>

pkgname=portmod-migrate
pkgver=0.1.0
pkgrel=1
pkgdesc="A tool to help migrate from manually installed OpenMW mods to Portmod"
provides=('portmod-migrate')
conflicts=('portmod-migrate')
arch=(any)
url="https://gitlab.com/portmod/portmod-migrate"
license=(GPL3)
depends=("python" "portmod" "python-fuzzywuzzy")
makedepends=("python" "python-setuptools" "python-setuptools-scm")
checkdepends=("python-pytest")
source=("https://gitlab.com/portmod/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('1ce949cf9b8fd70ed4f76aa93d2048e347c976e056c32e6494a86d97d9d7dc38957f96cd159bdbd61c597307468dc237a3a6be514d077787ab42694525813767')

package() {
  cd "$srcdir/$pkgname-v$pkgver"
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python setup.py install --root $pkgdir
}
