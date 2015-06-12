# Maintainer: Lara Maia <lara@craft.net.br>

pkgname=lm_sensors-f2a78m-conf
pkgdesc="libsensors3 configuration file for the GIGABYTE GA-F2a78M-D3H"
url="http://lara.craft.net.br"
pkgver=1.0
pkgrel=2
license=('GPL')
arch=(any)
depends=(lm_sensors)
install=$pkgname.install

source=(http://lara.craft.net.br/f2a78m.conf
        $pkgname.install)

md5sums=('f4a8db81b0914cc872fa7373873a11e6'
         'd1fe9b78311a562011a86cd3ce88d4ff')

package() {
    install -dm755 "$pkgdir"/etc/{modprobe.d,modules-load.d,sensors.d}/

    echo "it87" > "$pkgdir"/etc/modules-load.d/f2a78m_sensors.conf
    echo "options it87 force_id=0x8728" > "$pkgdir"/etc/modprobe.d/f2a78m_sensors.conf

    install -Dm644 f2a78m.conf "$pkgdir"/etc/sensors.d/
}
