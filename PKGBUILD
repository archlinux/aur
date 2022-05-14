# Maintainer: Tim-Luca Lagmöller <mail@lagmoellertim.de>
pkgname=rescreen
pkgver=1.0.4
pkgrel=1
pkgdesc="Display Manager with fractional scaling support for X11"
arch=('any')
url="https://github.com/lagmoellertim/rescreen"
license=('MIT')
groups=()
depends=(xorg-xrandr xorg-xev python3 pyside2 python-loguru python-pydantic edid-decode-git)
makedepends=(python-wheel python-setuptools desktop-file-utils)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
noextract=()
sha512sums=('eadd7e39f36965f09ce2ae289d5298418aa1f1691d796c79b6017f722dde36cf62b458bd6c98e8364e2f7a4c946deba84a3899196555b570fbf75140eff7e612')

build() {
  cd ${pkgname}-${pkgver}
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}