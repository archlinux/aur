# Maintainer: Benjamin Winger <bmw@disroot.org>

pkgname=portmod-migrate
pkgver=0.1.1
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
sha512sums=('09afe9a3ff6933e27c86311fdb787c079c81963c84be10f85866c2cc15446262328aca60f31773f47c364abd6cdaefb8a8c27a2a2164f680a0646cd204a504aa')

package() {
  cd "$srcdir/$pkgname-v$pkgver"
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python setup.py install --root $pkgdir
}
