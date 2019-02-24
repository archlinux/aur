# Maintainer: lambdadroid <lambdadroid@gmail.com>
pkgname=thermald-me176c
pkgver=r2.c4dd389
pkgrel=1
pkgdesc="Thermal daemon configuration files for ASUS MeMO Pad 7 (ME176C(X))"
arch=(any)
_repo=linux-me176c
url="https://github.com/me176c-dev/$_repo"
license=('MIT')
groups=(me176c)
depends=('thermald')
options=('!strip')
_revision=c4dd3897686c33f3c8ac46344a26ec6e1683d3e2
source=("$url/archive/$_revision.tar.gz")
sha256sums=('95b8430db1959068a84f42650e8ac312253e7fabede64441522feb1781fafd7b')

package() {
    cd "$_repo-$_revision/thermal"

    install -Dm644 thermald-me176c.service "$pkgdir"/usr/lib/systemd/system/thermald-me176c.service
    install -Dm644 thermal-conf-me176c.xml "$pkgdir"/etc/thermald/thermal-conf-me176c.xml
}
