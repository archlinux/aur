# Maintainer: picokan <todaysoracle@protonmail.com>

pkgname=scrutiny-runit
pkgver=20250508
pkgrel=1
pkgdesc="Runit service script for scrutiny."
arch=("x86_64")
url="https://github.com/AnalogJ/scrutiny"
license=("MIT")
depends=( "runit" "scrutiny")
source=("scrutiny.run" "scrutiny.log.run" "scrutiny.conf" "scrutiny-collector.run" "scrutiny-collector.conf")
sha256sums=('24247df54c3ca0f01b74d786c5c718687bf0ceeeae256bc20be60027872ec26a'
            '99f89bb8507905cfc6d3a06fd91954464fb836a83e95107d958be49866312a93'
            '10f6b54f578cf0982ab90d3440e11378b50f1e2b36ae1b6c3e5238d203f76f09'
            '6b10e19389d3bb021ef2706c16bfe5ee3a4f90dba13569fb14cc6479e6a5e6bd'
            '7bd2f79ca81ada3128a4fc90a1b976b2687850650e6e84f5711fa9b448143f42')

package() {
    cd "$srcdir"
    install -Dm755 scrutiny.run "$pkgdir/etc/runit/sv/scrutiny/run"
    install -Dm755 scrutiny.log.run "$pkgdir/etc/runit/sv/scrutiny/log/run"
    install -Dm755 scrutiny.conf "$pkgdir/etc/runit/sv/scrutiny/conf"
    install -Dm755 scrutiny-collector.run "$pkgdir/etc/runit/sv/scrutiny-collector/run"
    install -Dm755 scrutiny-collector.conf "$pkgdir/etc/runit/sv/scrutiny-collector/conf"
}
