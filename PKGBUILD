# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>
# Contributor: Marc Vidal <mvidaldp@gmail.com>

pkgname=adguardhome-bin
_name=${pkgname%-bin}
pkgver=0.107.76
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
sha256sums_armv7h=('0c60e959fc9ef0c8a0a728961390e6f77cbc9fcd8f3de07646be52cefe68d988')
sha256sums_aarch64=('0eb7e9fbcdc46fba763f173aaa2787fb0d3a628b15ef60948da6f875f9c2aaf5')
sha256sums_pentium4=('a1d106bb1b2003293734d6e18b44a42f053a1dc2bde89311a3f73ea3ebd9e232')
sha256sums_powerpc64le=('9b8f6aa7b9660d61b9cd584f7272b9d54f58316e8a276cd67d9160617b456e8d')
sha256sums_riscv64=('0b3b7c6714a20766b7fcb65966f372f309035c439cade7a70f272c674fc9d281')
sha256sums_x86_64=('23f364f13a452cf2d4f7c5b1465508a83fda803e56bd38297fa62ab31734e222')

package() {
    install -Dm755 AdGuardHome/AdGuardHome "$pkgdir/usr/bin/$_name"
    install -Dm644 AdGuardHome/CHANGELOG.md -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 $_name.service -t "$pkgdir/usr/lib/systemd/system"
    install -Dm644 $_name.sysusers "$pkgdir/usr/lib/sysusers.d/$_name.conf"
    install -d "$pkgdir/etc"
    ln -s /var/lib/$_name/AdGuardHome.yaml "$pkgdir/etc/$_name.yaml"
}
