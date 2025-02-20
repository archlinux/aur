# Maintainer: Your Name <claudemods101@gmail.com>
pkgname=apexisocreatorgui
pkgver=1.0
pkgrel=1
pkgdesc="Arch Iso Creator Qt6 Gui (Pre-Compiled)"
arch=('x86_64')
url="https://github.com/claudemods/ApexArchIsoCreatorGuiAppImage"
license=('GPL')
depends=(
  'arch-install-scripts' 'bash-completion' 'dosfstools' 'erofs-utils' 'findutils' 'git' 'grub' 'jq' 'libarchive'
  'libisoburn' 'lsb-release' 'lvm2' 'mkinitcpio-archiso' 'mkinitcpio-nfs-utils' 'mtools' 'nbd' 'pacman-contrib'
  'parted' 'procps-ng' 'pv' 'python' 'rsync' 'sshfs' 'syslinux' 'xdg-utils' 'zsh-completions' 'kernel-modules-hook'
  'virt-manager' 'kate' 'konsole' 'squashfs-tools' 'gnome-boxes'
)
optdepends=(
'apexisocreatorscript: Optional Installer (alternative for konsole use)'
  'apexinstaller: Optional Installer (requires yay to be installed without sudo)'
)
source=("git+https://github.com/claudemods/ApexArchIsoCreatorGuiAppImage.git")
md5sums=('SKIP')

package() {
  cd "$srcdir/ApexArchIsoCreatorGuiAppImage"

  # Install the pre-compiled binary to /usr/bin
  install -Dm755 "apexisocreatorgui" "$pkgdir/usr/bin/apexisocreatorgui"

  # Install the .desktop file to /usr/share/applications
  install -Dm644 "apexisocreatorgui.desktop" "$pkgdir/usr/share/applications/apexisocreatorgui.desktop"

  # Install the custom icon to /usr/share/icons/hicolor/256x256/apps/
  install -Dm644 "pirate-ship2.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/pirate-ship2.png"
}
