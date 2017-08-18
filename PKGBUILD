# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=glassfish5
pkgver=5.0_b21
pkgrel=1
pkgdesc="The Open Source Java EE 8 Reference Implementation."
url="https://javaee.github.io/glassfish/"
license=("CDDL")
depends=("java-environment>=8")
arch=("any")
options=(!strip)
source=("http://download.oracle.com/glassfish/5.0/promoted/glassfish-${pkgver//_/-}.zip"
		"glassfish5.service")

sha256sums=('69231fadc1a5edb5c2d08f768a75bc2923291b1cbfab5de58377724c04d96beb'
            '9be6b53df62a719e4cac1b54703f0abcc6c22389d1b46e3e85ed38d6f1453cdc')

package() {
    install -d "$pkgdir/opt"
    cp -a glassfish5 "$pkgdir/opt/glassfish5"
    install -D glassfish5.service "$pkgdir/usr/lib/systemd/system/glassfish5.service"
}
