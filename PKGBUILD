# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=acestream-launcher
pkgver=2.0.3
pkgrel=1
pkgdesc="Acestream Launcher allows you to open Acestream links with a Media Player of your choice"
arch=("any")
url="https://github.com/jonian/acestream-launcher"
license=("GPL")
depends=("python" "python-acestream")
optdepends=("mpv" "libnotify" "acestream-engine")
makedepends=("python-setuptools")
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
md5sums=("bc192fd06259bf19c3c07c276ed21dd5")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
