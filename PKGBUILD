# Maintainer: The_Seventh <gustavo.gianeli13@gmail.com>
pkgname=arch-update-full
pkgver=4.0
pkgrel=1
pkgdesc="Sentinel Protocol: Update automation (Pacman/AUR/Flatpak/Snap) and auditing."
arch=('any')
url="https://github.com/GustavoGianeli/arch-update-full"
license=('MIT')
depends=('systemd' 'bash' 'pacman' 'pacman-contrib' 'libnotify' 'procps-ng' 'pciutils' 'coreutils' 'curl' 'wget')
optdepends=(
  'yay: For AUR update support'
  'paru: For AUR update support'
  'pikaur: For AUR update support '
  'flatpak: For Flatpak package detection and updates'
  'snapd: For Snap package detection and updates'
  'reflector: For automatic mirrorlist optimization'
  'dunst: Required for notifications and interactive buttons in Window Managers (i3, Hyprland, etc.)'
  'noto-fonts-emoji: for proper rendering of icons in desktop notifications'
  'glib2: For launching applications via gio'
  'dex: For launching .desktop files'
)


# --- ADICIONADO O ÍCONE NO SOURCE // The icon has been added to the source. ---
install=arch-update-full.install

source=(
  "arch-update-full"
  "arch-update-full.desktop"
  "novalogoarchupdatefullv39.png"
  "arch-update-full.install"
  "farol_azul_simbolo.png"
  "farol_amarelo_simbolo.png"
  "farol_vermelho_simbolo.png"
)

# Use 'updpkgsums' para preencher isso automaticamente // Use 'updpkgsums' to automatically fill this in.
sha256sums=('13d02c72771d20f4038e7a817308110d804d3f616a9b2d77b06cb4c05abb74a5'
            'e2fe7931fbc9c2b40c33d24f1b320d5c140e4677ebf5ca0e0c8e02b5c993f1ed'
            '68199b22bece3ede43eb6d7f90f8a44c4c2d5e11c5c053051b047907be154804'
            'c32ddd13aaace4abab054d1742aaa88cdae72a670b569aaea0f124a555f60a2d'
            'ebc439c303205e80b177683cc62086fbcc3abbe24ec5c47833c0ab0a6b7b4ee0'
            '9aaa2af5ddec871a8ec529839867994cf60aa2e65f7d86696a52c2bf2db464c8'
            'f1be46c984f0fdeee93919229c72975187d3ea29065c571f2d1cc96da04bf6f8')

package() {
  # 1. Instala o script executável // Install the executable script.
  install -Dm755 "${srcdir}/arch-update-full" "${pkgdir}/usr/bin/arch-update-full"
  
  # 2. Instala o atalho no menu // Install the shortcut in the menu.
  install -Dm644 "${srcdir}/arch-update-full.desktop" "${pkgdir}/usr/share/applications/arch-update-full.desktop"

  # 3. Instala o ícone no diretório global de imagens do sistema // Installs the icon in the system's global image directory.
  install -Dm644 "${srcdir}/novalogoarchupdatefullv39.png" "${pkgdir}/usr/share/pixmaps/novalogoarchupdatefullv39.png"
  
  # 4. Ícones do Módulo Sentinela (Faróis de Notificação)
  install -Dm644 "${srcdir}/farol_azul_simbolo.png" "${pkgdir}/usr/share/arch-update-full/icons/farol_azul_simbolo.png"
  install -Dm644 "${srcdir}/farol_amarelo_simbolo.png" "${pkgdir}/usr/share/arch-update-full/icons/farol_amarelo_simbolo.png"
  install -Dm644 "${srcdir}/farol_vermelho_simbolo.png" "${pkgdir}/usr/share/arch-update-full/icons/farol_vermelho_simbolo.png"
}
