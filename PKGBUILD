# Maintainer: The_Seventh <gustavo.gianeli13@gmail.com>
pkgname=arch-update-full
pkgver=4.0
pkgrel=2.1
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
  "novalogov40.png"
  "arch-update-full.install"
  "farol_azul_simbolo.png"
  "farol_amarelo_simbolo.png"
  "farol_vermelho_simbolo.png"
)

# Use 'updpkgsums' para preencher isso automaticamente // Use 'updpkgsums' to automatically fill this in.
sha256sums=('f53adb529c7618c7f4995c00ced13710c6f52a77ce8bfee4bf85a1e3dd5be518'
            '057c70b44bc6e8f3c82a5ed1f1c49e1fd2dbed8d7c523f4fc7bb54c12358024a'
            '5cfc6fd23427182f589c0406225147530cf25dac3b020ec10427590be7cba917'
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
  install -Dm644 "${srcdir}/novalogov40.png" "${pkgdir}/usr/share/pixmaps/novalogov40.png"
  
  # 4. Ícones do Módulo Sentinela (Faróis de Notificação)
  install -Dm644 "${srcdir}/farol_azul_simbolo.png" "${pkgdir}/usr/share/arch-update-full/icons/farol_azul_simbolo.png"
  install -Dm644 "${srcdir}/farol_amarelo_simbolo.png" "${pkgdir}/usr/share/arch-update-full/icons/farol_amarelo_simbolo.png"
  install -Dm644 "${srcdir}/farol_vermelho_simbolo.png" "${pkgdir}/usr/share/arch-update-full/icons/farol_vermelho_simbolo.png"
}
