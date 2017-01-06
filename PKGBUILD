# Maintainer: Giorgio Gilestro <giorgio@gilest.ro>

pkgname=ha-bridge
pkgver=3.5.1
pkgrel=3
pkgdesc='Home automation bridge that emulates a Philips Hue light system and can control other systems such as a Vera, Harmony Hub, Nest, MiLight bulbs or any other system that has an http/https/tcp/udp interface.'
arch=('any')
url='https://github.com/bwssytems/ha-bridge'
license=('GPL')
depends=('java-runtime=8')
noextract=("$pkgname-$pkgver.jar")
source=("https://github.com/bwssytems/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.jar"
        "habridge.service")
md5sums=('8688150b6cb9fd394eb5db87301dcf14'
	 '42ae1d0661558cd5e504027989b9dd27'
	)

package() {

  install -d "$pkgdir/usr/share/habridge/"
  install -d "$pkgdir/usr/share/habridge/data/"

  install -D -m644 "$pkgname-${pkgver}.jar"     "${pkgdir}/usr/share/habridge/$pkgname-${pkgver}.jar"
  install -D "habridge.service" "$pkgdir/usr/lib/systemd/system/habridge.service"
}
