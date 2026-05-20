# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>
# Contributor: Marc Vidal <mvidaldp@gmail.com>

pkgname=adguardhome-bin
_name=${pkgname%-bin}
pkgver=0.107.75
pkgrel=1
pkgdesc='Network-wide ads and trackers blocking DNS server'
arch=(armv7h aarch64 pentium4 powerpc64le riscv64 x86_64)
url='https://github.com/AdguardTeam/AdGuardHome'
license=(GPL-3.0-only)
provides=($_name)
conflicts=($_name)
options=(!debug)
source=($_name.service $_name.sysusers)
source_armv7h=("AdGuardHome-$pkgver-armv7h.tar.gz::$url/releases/download/v$pkgver/AdGuardHome_linux_armv7.tar.gz")
source_aarch64=("AdGuardHome-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/AdGuardHome_linux_arm64.tar.gz")
source_pentium4=("AdGuardHome-$pkgver-pentium4.tar.gz::$url/releases/download/v$pkgver/AdGuardHome_linux_386.tar.gz")
source_powerpc64le=("AdGuardHome-$pkgver-powerpc64le.tar.gz::$url/releases/download/v$pkgver/AdGuardHome_linux_ppc64le.tar.gz")
source_riscv64=("AdGuardHome-$pkgver-riscv64.tar.gz::$url/releases/download/v$pkgver/AdGuardHome_linux_riscv64.tar.gz")
source_x86_64=("AdGuardHome-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/AdGuardHome_linux_amd64.tar.gz")
sha256sums=('b3763af1dae4d32645f3489cde5f07c919c7de9c76495a87268410347c67b873'
            'cdbb882eb167461418ea7ea5cca65d32fd018a231ac1a8bb7f3e7140345c8cf1')
sha256sums_armv7h=('ae411f837570b381d552412134c24f9c71bd910e82ce5bb35ff0e35913f5a5d9')
sha256sums_aarch64=('02db5aa194fabfe323b21874f77a870822911cff6bcff4a455ba0d5d00b631fe')
sha256sums_pentium4=('6af620b0511d7b4c1c8a4b490d7ddbeab4ed53b43e30d672acca9b2a48d45c9b')
sha256sums_powerpc64le=('7557301cfedb2e33f57b572c5ed7e84aedf0279d714a2c2f5533c2a6e699110f')
sha256sums_riscv64=('05394ddbf47a279c9184602f0c19b57bc6cb819fe8902162a263ea9bb2a52b44')
sha256sums_x86_64=('0489ee74a626339ee88a8b53e463802e32049819575fd1be751868ed3380d7ce')

package() {
    install -Dm755 AdGuardHome/AdGuardHome "$pkgdir/usr/bin/$_name"
    install -Dm644 AdGuardHome/CHANGELOG.md -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 $_name.service -t "$pkgdir/usr/lib/systemd/system"
    install -Dm644 $_name.sysusers "$pkgdir/usr/lib/sysusers.d/$_name.conf"
    install -d "$pkgdir/etc"
    ln -s /var/lib/$_name/AdGuardHome.yaml "$pkgdir/etc/$_name.yaml"
}
