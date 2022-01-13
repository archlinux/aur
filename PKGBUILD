# Maintainer: Funami
# Contributor: Lorenzo Fontana <lo@linux.com>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
# Contributor: Tristan Hill

pkgname=coredns-bin
pkgver=1.8.6
pkgrel=2
pkgdesc="A DNS server that chains plugins"
arch=('x86_64' 'aarch64')
url="https://github.com/coredns/coredns"
license=('Apache')
provides=('coredns')
conflicts=('coredns')
source=(coredns.service
        coredns-sysusers.conf)
source_x86_64=(coredns_${pkgver}.tar.gz::https://github.com/coredns/coredns/releases/download/v${pkgver}/coredns_${pkgver}_linux_amd64.tgz)
source_aarch64=(coredns_${pkgver}.tar.gz::https://github.com/coredns/coredns/releases/download/v${pkgver}/coredns_${pkgver}_linux_arm64.tgz)
sha256sums=('030cd8e938c293c11a9acdb09b138f98b37874772072336792ec4bf0d9eff9b1'
            'e3cc35967f12c8bca2961f4d98413958649072492fe37052249a8cbcd2313ed1')
sha256sums_x86_64=('b97ce1a3ca01a0f5687dbc825ed4d8fd3ec14ed71b3abe0bc8b9bcc4cc4d337b')
sha256sums_aarch64=('e6e4667c237e3355c3a611c1dc59e3fc83a49c23d1034a8c1bb14a0aebf8410e')

package() {
    install -Dm755 "$srcdir/coredns" "$pkgdir/usr/bin/coredns"
    install -Dm644 "$srcdir/coredns.service" "$pkgdir/usr/lib/systemd/system/coredns.service"
    install -Dm644 "$srcdir/coredns-sysusers.conf" "$pkgdir/usr/lib/sysusers.d/coredns.conf"
    install -d "${pkgdir}/etc/coredns"
}
