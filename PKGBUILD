# Maintainer: The_Seventh <gustavo.gianeli@hotmail.com>
pkgname=arch-update-full
pkgver=3.9
pkgrel=1
pkgdesc="Sentinel Protocol: Update automation (Pacman/AUR/Flatpak/Snap) and auditing."
arch=('any')
url="https://github.com/GustavoGianeli/arch-update-full"
license=('MIT')
depends=('systemd' 'bash' 'pacman' 'pacman-contrib' 'libnotify' 'procps-ng' 'pciutils' 'coreutils' 'curl' 'wget')
optdepends=(
  'yay: For AUR update support'
  'paru: For AUR update support'
  'flatpak: For Flatpak package detection and updates'
  'snapd: For Snap package detection and updates'
  'reflector: For automatic mirrorlist optimization'
  'dunst: Required for notifications and interactive buttons in Window Managers (i3, Hyprland, etc.)'
  'noto-fonts-emoji: for proper rendering of icons in desktop notifications'
)


# --- ADICIONADO O ÍCONE NO SOURCE // The icon has been added to the source. ---
install=arch-update-full.install

source=("arch-update-full" 
        "arch-update-full.desktop" 
        "novalogoarchupdatefullv39.png"
        "arch-update-full.install")

# Use 'updpkgsums' para preencher isso automaticamente // Use 'updpkgsums' to automatically fill this in.
sha256sums=('ec83d062eed4c523a3d949ad19ae3a126938e2e02363e9bebb3328a2275542b1'
            'e2fe7931fbc9c2b40c33d24f1b320d5c140e4677ebf5ca0e0c8e02b5c993f1ed'
            '68199b22bece3ede43eb6d7f90f8a44c4c2d5e11c5c053051b047907be154804'
            'c32ddd13aaace4abab054d1742aaa88cdae72a670b569aaea0f124a555f60a2d')

package() {
  # 1. Instala o script executável // Install the executable script.
  install -Dm755 "${srcdir}/arch-update-full" "${pkgdir}/usr/bin/arch-update-full"
  
  # 2. Instala o atalho no menu // Install the shortcut in the menu.
  install -Dm644 "${srcdir}/arch-update-full.desktop" "${pkgdir}/usr/share/applications/arch-update-full.desktop"

  # 3. Instala o ícone no diretório global de imagens do sistema // Installs the icon in the system's global image directory.
  install -Dm644 "${srcdir}/novalogoarchupdatefullv39.png" "${pkgdir}/usr/share/pixmaps/novalogoarchupdatefullv39.png"
}
