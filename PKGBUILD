# Maintainer: VC365
pkgname=grub-qemu
pkgver=0.1.3
pkgrel=4
pkgdesc="a lightweight App for Preview full GRUB"
arch=('x86_64')
url="https://github.com/VC365/grub-qemu/"
license=('GPL3')
depends=('qemu-system-x86' 'qemu-desktop' 'edk2-ovmf')
makedepends=('git')
source=("git+https://github.com/VC365/grub-qemu.git#tag=v$pkgver")
sha256sums=('SKIP')

# Install script

package() {
    cd "$srcdir/grub-qemu"
    install -Dm755 grub-qemu "$pkgdir/usr/bin/grub-qemu"

    # Install OVMF file if needed
    if [ ! -f "/usr/share/ovmf/x64/OVMF.4m.fd" ]; then
       mkdir -p "$pkgdir/usr/share/ovmf/x64"
       install -Dm644 OVMF.4m.fd "$pkgdir/usr/share/ovmf/x64/OVMF.4m.fd"
    fi
}
