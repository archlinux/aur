pkgname=natbypassd
pkgver=1.1
pkgrel=1
pkgdesc="NAT bypass by reverse SSH tunnel"
arch=("any")
url="https://gitlab.com/scpketer/natbypassd"
license=("GPL3")
depends=("bash" "autossh" "systemd")
source=("git+https://gitlab.com/scpketer/natbypassd.git#tag=v1.1")
backup=("etc/natbypassd.d/relays.conf" "etc/natbypassd.d/routes.conf")
sha256sums=("SKIP")

package() {
    mkdir -p "$pkgdir/usr/bin"
    cp "$srcdir/natbypassd/natbypassd" "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/etc/natbypassd.d"
    cp -r "$srcdir/natbypassd/conf/." "$pkgdir/etc/natbypassd.d/"
    chmod 775 "$pkgdir/usr/bin/natbypassd"
    mkdir -p "$pkgdir/usr/lib/systemd/system"
    cp "$srcdir/natbypassd/systemd/natbypassd.service" "$pkgdir/usr/lib/systemd/system"
}
