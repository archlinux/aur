# Maintainer: Alexeyev Vitaly
# Сгенерировано syngui package -f aur --workspace из syngui-release.toml — правки делать там.
pkgname=syn-vm-bin
pkgver=0.2.0
pkgrel=1
arch=('x86_64' 'aarch64')
url='https://github.com/VitaminDB/synshell'
license=('GPL-3.0-only')
pkgdesc='synshell virtual machines on QEMU/KVM: wizard, built-in display, snapshots, USB and PCI passthrough, guest agent, CLI and MCP'
depends=('synshell-core')
optdepends=('qemu-desktop: the virtual machines themselves'
            'edk2-ovmf: UEFI'
            'swtpm: TPM 2.0 for Windows 11'
            'virtiofsd: virtiofs shared folder (Windows)'
            'samba: SMB shared folder'
            'virtio-win: Windows drivers and guest agent (AUR)'
            'libisoburn: syn-vm guest tools image (xorriso)')
provides=('syn-vm')
conflicts=('syn-vm' 'syn-vm-git')
groups=('synshell-apps')
options=('!strip' '!debug')
noextract=('syn-vm-0.2.0-x86_64.tar.zst' 'syn-vm-0.2.0-aarch64.tar.zst')
source_x86_64=("syn-vm-0.2.0-x86_64.tar.zst::https://github.com/VitaminDB/synshell/releases/download/v$pkgver/syn-vm-0.2.0-x86_64.tar.zst")
sha256sums_x86_64=('bbf27e76d09566cd732ea44762caf08469b67d439e127c6951acc5e7200e6d80')
source_aarch64=("syn-vm-0.2.0-aarch64.tar.zst::https://github.com/VitaminDB/synshell/releases/download/v$pkgver/syn-vm-0.2.0-aarch64.tar.zst")
sha256sums_aarch64=('0cb6c2f3acb73c43df9fbabc885aa9380377c4eb6d7042c6efda2606201096a0')

package() {
    bsdtar -xpf "$srcdir/syn-vm-$pkgver-$CARCH.tar.zst" -C "$pkgdir"
}
