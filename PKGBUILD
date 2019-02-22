# Maintainer: lambdadroid <lambdadroid@gmail.com>
pkgname=thermald-me176c
pkgver=r1.e166b7d
pkgrel=1
pkgdesc="Thermal daemon configuration files for ASUS MeMO Pad 7 (ME176C[X])"
arch=(any)
_repo=linux-me176c
url="https://github.com/me176c-dev/$_repo"
license=('MIT')
depends=('thermald')
options=('!strip')
_revision=e166b7dcad1ce895938ff1965ecd8cbc0e86c7fc
source=("$url/archive/$_revision.tar.gz")
sha256sums=('7d261409de5bbd388402aa12dc2c676228fa806fb1d0d565d4d778144fe82549')

package() {
    cd "$_repo-$_revision/thermal"

    install -Dm644 thermald-me176c.service "$pkgdir"/usr/lib/systemd/system/thermald-me176c.service
    install -Dm644 thermal-conf-me176c.xml "$pkgdir"/etc/thermald/thermal-conf-me176c.xml
}
