# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>
# Contributor: Marc Vidal <mvidaldp@gmail.com>

pkgname=adguardhome-bin
_name=${pkgname%-bin}
pkgver=0.107.73
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
sha256sums_armv7h=('6e849fcd2cdde5e4bdf847ad65c1d66443fe4395f95a07d736dc618dca5db09c')
sha256sums_aarch64=('8b9e3a132939a460e78085ae985f79ed3119cd14945801e615c4f5f8d0a55bb9')
sha256sums_pentium4=('b2bb10a92c22474ac06c3ac0806a4dd698d8020826964b2b583d6f3f5be1c659')
sha256sums_powerpc64le=('a1cd46d174f78f663b5738eae9e015c1f3af3e3c62a460f6fdc4a80574596fb3')
sha256sums_riscv64=('09e78ca21f496fff92fd01e3d6cbde42cda3e13dd4bfc2f97de9d7dbd4d65beb')
sha256sums_x86_64=('bf61a592ce8edeb38b3aff19033a90e704f733cb08114fa52730584a52727ee4')

package() {
    install -Dm755 AdGuardHome/AdGuardHome "$pkgdir/usr/bin/$_name"
    install -Dm644 AdGuardHome/CHANGELOG.md -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 $_name.service -t "$pkgdir/usr/lib/systemd/system"
    install -Dm644 $_name.sysusers "$pkgdir/usr/lib/sysusers.d/$_name.conf"
    install -d "$pkgdir/etc"
    ln -s /var/lib/$_name/AdGuardHome.yaml "$pkgdir/etc/$_name.yaml"
}
