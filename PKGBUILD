# Maintainer: Your Name <claudemods101@gmail.com>
pkgname=apexisocreatorscript
pkgver=1.01
pkgrel=1
pkgdesc="Arch Iso Creator Script (Pre-Compiled)"
arch=('x86_64')
url="https://github.com/claudemods/ApexArchIsoCreatorScriptAppImage"
license=('GPL')
depends=(
  'arch-install-scripts' 'bash-completion' 'dosfstools' 'erofs-utils' 'findutils' 'git' 'grub' 'jq' 'libarchive'
  'libisoburn' 'lsb-release' 'lvm2' 'mkinitcpio-archiso' 'mkinitcpio-nfs-utils' 'mtools' 'nbd' 'pacman-contrib'
  'parted' 'procps-ng' 'pv' 'python' 'rsync' 'sshfs' 'syslinux' 'xdg-utils' 'zsh-completions' 'kernel-modules-hook'
  'virt-manager' 'kate' 'konsole' 'squashfs-tools'
)
optdepends=(
  'apexinstaller: Optional Installer (requires yay to be installed without sudo)'
)
source=("git+https://github.com/claudemods/ApexArchIsoCreatorScriptAppImage.git")
md5sums=('SKIP')

package() {
  cd "$srcdir/ApexArchIsoCreatorScriptAppImage"

  # Install the pre-compiled binary to /usr/bin
  install -Dm755 "apexisocreatorscript" "$pkgdir/usr/bin/apexisocreatorscript"

  # Install the .desktop file to /usr/share/applications
  install -Dm644 "apexisocreatorscript.desktop" "$pkgdir/usr/share/applications/apexisocreatorscript.desktop"

  # Install the custom icon to /usr/share/icons/hicolor/256x256/apps/
  install -Dm644 "pirate-ship.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/pirate-ship.png"
}
