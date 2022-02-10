# Maintainer: Funami
# Contributor: Lorenzo Fontana <lo@linux.com>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
# Contributor: Tristan Hill

pkgname=coredns-bin
pkgver=1.9.0
pkgrel=1
pkgdesc="A DNS server that chains plugins"
arch=('x86_64' 'aarch64')
url="https://github.com/coredns/coredns"
license=('Apache')
provides=('coredns')
conflicts=('coredns')
source=(coredns.service
        coredns-sysusers.conf)
source_x86_64=(coredns_${pkgver}_x86_64.tar.gz::https://github.com/coredns/coredns/releases/download/v${pkgver}/coredns_${pkgver}_linux_amd64.tgz)
source_aarch64=(coredns_${pkgver}_aarch64.tar.gz::https://github.com/coredns/coredns/releases/download/v${pkgver}/coredns_${pkgver}_linux_arm64.tgz)
sha256sums=('030cd8e938c293c11a9acdb09b138f98b37874772072336792ec4bf0d9eff9b1'
            'e3cc35967f12c8bca2961f4d98413958649072492fe37052249a8cbcd2313ed1')
sha256sums_x86_64=('c5a5f85ec8bf2fb99f27a4b714c1fb1d9639b75772b07455cef75b8b3392616e')
sha256sums_aarch64=('8f6dd0e0b56df10d05150f1b9bc0a3859a733cfba65f56f9cda626bdc4feeef4')

package() {
    install -Dm755 "$srcdir/coredns" "$pkgdir/usr/bin/coredns"
    install -Dm644 "$srcdir/coredns.service" "$pkgdir/usr/lib/systemd/system/coredns.service"
    install -Dm644 "$srcdir/coredns-sysusers.conf" "$pkgdir/usr/lib/sysusers.d/coredns.conf"
    install -d "${pkgdir}/etc/coredns"
}
