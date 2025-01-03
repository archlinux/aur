# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=wpka
pkgver=0.1.1
pkgrel=3
pkgdesc='wayland polkit-agent that lets you use any input'
url='https://github.com/abenz1267/wpka'
arch=('x86_64')
license=('MIT')
makedepends=('go')
conflicts=('wpka')
provides=('wpka')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5d75690e6fec2b707da566092ac19f6448726b23986863ad02ca70b46365bb70')
b2sums=('3258919bf0fc9f43915d732a30259eb15040bbd0ac99d7f31280fee14908820f28aa826ee969416997fe0dbb14bcaef58d584e19ba1a7ef29e1915275457dc6d')

build() {
  cd ${pkgname}-${pkgver}

  go build -x -o wpka
}

package() {
  cd ${pkgname}-${pkgver}

  install -Dm 755 wpka -t "${pkgdir}/usr/bin"
  install -Dm 644 dev.benz.wpka.PolicyKit1.AuthenticationAgent.conf -t "${pkgdir}/usr/share/dbus-1/system.d/"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
