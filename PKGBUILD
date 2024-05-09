pkgname=chicken-mosquitto
_name=mosquitto
pkgver=0.1.5
pkgrel=1
pkgdesc='Chicken Scheme Bindings to mosquitto MQTT client library'
arch=('x86_64')
license=('MIT')
depends=("mosquitto" "chicken" "chicken-srfi-1")
url='http://wiki.call-cc.org/eggref/5/mosquitto'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

