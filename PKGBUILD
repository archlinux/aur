# Maintainer: Giorgio Gilestro <giorgio@gilest.ro>

pkgname=ha-bridge
pkgver=4.5.0
pkgrel=1
pkgdesc='Home automation bridge that emulates a Philips Hue light system and can control other systems such as a Vera, Harmony Hub, Nest, MiLight bulbs or any other system that has an http/https/tcp/udp interface.'
arch=('any')
url='https://github.com/bwssytems/ha-bridge'
license=('GPL')
depends=('java-runtime=8')
noextract=("$pkgname-$pkgver.jar")
source=("https://github.com/bwssytems/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.jar"
        "habridge.service")
md5sums=('8a044c4c9371759d6a16212e95f4730c'
	 '42ae1d0661558cd5e504027989b9dd27'
	)

package() {

  install -d "$pkgdir/usr/share/habridge/"
  install -d "$pkgdir/usr/share/habridge/data/"

  install -D -m644 "$pkgname-${pkgver}.jar"     "${pkgdir}/usr/share/habridge/$pkgname-${pkgver}.jar"
  install -D "habridge.service" "$pkgdir/usr/lib/systemd/system/habridge.service"
}
