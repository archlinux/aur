# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=acestream-launcher
pkgver=2.0.2
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
md5sums=("b6bc29ea58c45a567a9edb06d4b37898")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
