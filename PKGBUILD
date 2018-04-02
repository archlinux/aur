# Maintainer: Lorenzo Fontana <lo@linux.com>
pkgname=coredns-bin
pkgver=v1.1.1
pkgrel=1
pkgdesc="CoreDNS is a DNS server that chains plugins (official binary version)"
arch=('x86_64')
url="https://github.com/coredns/coredns"
license=('Apache')
provides=('coredns')
source=(coredns_x64_${pkgver}.tar.gz::https://github.com/coredns/coredns/releases/download/${pkgver}/coredns_1.1.1_linux_amd64.tgz
https://raw.githubusercontent.com/coredns/deployment/5bb111266eca2d47802e0d1a26bc55491ff2cec3/systemd/coredns.service
coredns-sysusers.conf)

sha256sums=('6e2367879163b1c9036d5c69a121e81bad628944b9b395f49a6e45a2d9d420dd'
'be3eb5ce8740b17053aaf04ca036a4d34e0b86d0737253be7094cda16a329cf5'
'178c632fd855a5a35ae69e13ab554d5abad696cf75d23c6b6b37f0ace3b4b0f2')

package() {
    install -Dm755 "$srcdir/coredns" "$pkgdir/usr/bin/coredns"
    install -Dm644 "$srcdir/coredns.service" "$pkgdir/usr/lib/systemd/system/coredns.service"
    install -Dm644 "$srcdir/coredns-sysusers.conf" "$pkgdir/usr/lib/sysusers.d/coredns.conf"
    install -d "${pkgdir}/etc/coredns"
}
