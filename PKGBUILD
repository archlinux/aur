# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>
# Contributor: Marc Vidal <mvidaldp@gmail.com>

pkgname=adguardhome-bin
_name=${pkgname%-bin}
pkgver=0.107.79
pkgrel=1
pkgdesc='Network-wide ads and trackers blocking DNS server'
arch=(armv7h aarch64 pentium4 powerpc64le riscv64 x86_64)
url=https://github.com/AdguardTeam/AdGuardHome
license=(GPL-3.0-only)
provides=($_name)
conflicts=($_name)
options=(!debug)
source=($_name.service $_name.sysusers)
source_armv7h=(AdGuardHome-$pkgver-armv7h.tar.gz::$url/releases/download/v$pkgver/AdGuardHome_linux_armv7.tar.gz)
source_aarch64=(AdGuardHome-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/AdGuardHome_linux_arm64.tar.gz)
source_pentium4=(AdGuardHome-$pkgver-pentium4.tar.gz::$url/releases/download/v$pkgver/AdGuardHome_linux_386.tar.gz)
source_powerpc64le=(AdGuardHome-$pkgver-powerpc64le.tar.gz::$url/releases/download/v$pkgver/AdGuardHome_linux_ppc64le.tar.gz)
source_riscv64=(AdGuardHome-$pkgver-riscv64.tar.gz::$url/releases/download/v$pkgver/AdGuardHome_linux_riscv64.tar.gz)
source_x86_64=(AdGuardHome-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/AdGuardHome_linux_amd64.tar.gz)
sha256sums=('b3763af1dae4d32645f3489cde5f07c919c7de9c76495a87268410347c67b873'
            'cdbb882eb167461418ea7ea5cca65d32fd018a231ac1a8bb7f3e7140345c8cf1')
sha256sums_armv7h=('7f8a4135ed427c5faafbc52d29845ea42acb38818bd7648626ddc07ee61a999e')
sha256sums_aarch64=('3f7893c18e8aaadc456d0452839190561c306ca95175a2254958be80a769c1ae')
sha256sums_pentium4=('e9a90f94f34d78e6d165f57b968a71aae0ba0233868246fff98cbef5f43fad30')
sha256sums_powerpc64le=('d26cfe76619ef5476fc172d515268ce6a53e6831c6b43514dc99b51d4fbc37f6')
sha256sums_riscv64=('9bd4a801e7791e047d6bba932f3a5f4e8f30b99f2b3c37418b011c75c7d6384b')
sha256sums_x86_64=('c48f4a43000665484c5ec28177de11a004759b620dae8f77b2aabefc9ef3687f')

package() {
    install -Dm755 AdGuardHome/AdGuardHome "$pkgdir/usr/bin/$_name"
    install -Dm644 AdGuardHome/CHANGELOG.md -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 $_name.service -t "$pkgdir/usr/lib/systemd/system"
    install -Dm644 $_name.sysusers "$pkgdir/usr/lib/sysusers.d/$_name.conf"
    install -d "$pkgdir/etc"
    ln -s /var/lib/$_name/AdGuardHome.yaml "$pkgdir/etc/$_name.yaml"
}
