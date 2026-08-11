# Maintainer: Mark Roboff <mark.roboff@bluecircuit.ai>
pkgname=vm-curator-bin
pkgver=1.4.0
pkgrel=1
pkgdesc="A TUI application to manage QEMU/KVM VMs (pre-built binary)"
arch=('x86_64')
url="https://github.com/mroboff/vm-curator"
license=('MIT')
depends=('gcc-libs' 'systemd-libs' 'qemu-base')
optdepends=(
    'qemu-system-x86: x86/x86_64 VM support'
    'qemu-system-arm: ARM/AArch64 VM support'
    'qemu-system-ppc: PowerPC VM support'
    'edk2-ovmf: UEFI boot support'
    'polkit: privilege escalation for KVM'
)
provides=('vm-curator')
conflicts=('vm-curator')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mroboff/vm-curator/releases/download/v$pkgver/vm-curator-v$pkgver-linux-x86_64.tar.gz")
sha256sums=('783e94d992029c56eb340f4fd43536441e441bb5bd6076b325eef75e44a339b7')

package() {
    install -Dm755 "vm-curator" "$pkgdir/usr/bin/vm-curator"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
