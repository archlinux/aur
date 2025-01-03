# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=wpka
pkgver=0.1.0
pkgrel=2
pkgdesc='wayland polkit-agent that lets you use any input'
url='https://github.com/abenz1267/wpka'
arch=('x86_64')
license=('MIT')
makedepends=('go')
conflicts=('wpka')
provides=('wpka')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1926c46d284f65d5d41f990524b21c9754a6320a4f43c6c47e20f5a2f7dd326a')
b2sums=('59d7d773803b8535520ffcc6140f6c97dafc607e562507f04b8e30b1ec001a6b12e90447e8b30477ee7781376e9a093576f303d564b356bd88e852a4e29d54af')

build() {
  cd ${pkgname}-${pkgver}

  go build -x -o wpka
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm 755 wpka -t "${pkgdir}/usr/bin"
  install -Dm 644 dev.benz.wpka.PolicyKit1.AuthenticationAgent.conf -t "${pkgdir}/usr/share/dbus-1/system.d/"

  #install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
