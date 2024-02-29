# Maintainer: Quentin Aniere
# Previous maintainer: Funami
# Contributor: Lorenzo Fontana <lo@linux.com>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
# Contributor: Tristan Hill

pkgname=coredns-bin
pkgver=1.11.2
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
sha256sums_x86_64=('bb3c8e24a4ec7e5c713f159f5f9403fee2ca0d467c789c2b25fad733dd395810')
sha256sums_aarch64=('12f4e575fa4e307ba62e3adead2a1416c28350f4ca4834a3f36dab7000d1d804')

package() {
    install -Dm755 "$srcdir/coredns" "$pkgdir/usr/bin/coredns"
    install -Dm644 "$srcdir/coredns.service" "$pkgdir/usr/lib/systemd/system/coredns.service"
    install -Dm644 "$srcdir/coredns-sysusers.conf" "$pkgdir/usr/lib/sysusers.d/coredns.conf"
    install -d "${pkgdir}/etc/coredns"
}
