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
    cd "${pkgname}"
    install -Dm755 "${pkgname}" -t "${pkgdir}/usr/bin"
    install -Dm644 "conf/"{relays.conf,routes.conf} -t "${pkgdir}/etc/natbypassd.d"
    install -Dm644 "systemd/${pkgname}.service" -t "${pkgdir}/usr/lib/systemd/system"
}
