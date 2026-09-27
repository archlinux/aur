# Maintainer: The_Seventh <gustavo.gianeli13@gmail.com>
pkgname=arch-update-full
pkgver=4.1
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
  "arch-update-full-sentinela"
  "arch-update-full.desktop"
  "novalogov41.png"
  "arch-update-full.install"
  "farol_azul_simbolo.png"
  "farol_amarelo_simbolo.png"
  "farol_vermelho_simbolo.png"
  "simbolo_tux_kernel_update.png"
)

# Use 'updpkgsums' para preencher isso automaticamente // Use 'updpkgsums' to automatically fill this in.
sha256sums=('e935222c65b8070f93c53843ead72a06aaf316bbf2ea983c57d69c79bc9365c9'
            '3dacab75d137b09c2ce011e8294b259173c8f750b3654835aac4caf8a7648c8f'
            'ed65d6a29af497de6c52abe86b8141282cb2b3f11264cb76a57bbfdebb7c6dff'
            '5cfc6fd23427182f589c0406225147530cf25dac3b020ec10427590be7cba917'
            '04a5fa6b7ef4c65c6f61ec31d24d16f0147d9519bdc585b743c73d313f9c2afc'
            'c58cf401d1220fe69d53a1266527d99f1aff1ab2add3d31f946aa1bf277c190f'
            '9cbee1e5686754aa92847375e6afc65f5996cf2eb79e57b7a83efe876d853ee8'
            '53945258786075a41ec0a95e5ef7417917f6100e2a3927138c3e765e369f1188'
            'dfc18ff554e7d92ffbc43936def6a698856743566270c7c0684148eac7e20b55')

package() {
# 1. Instala o script executável
  install -Dm755 "${srcdir}/arch-update-full" "${pkgdir}/usr/bin/arch-update-full"
  install -Dm755 "${srcdir}/arch-update-full-sentinela" "${pkgdir}/usr/bin/arch-update-full-sentinela"
  
  # 2. Instala o atalho no menu
  install -Dm644 "${srcdir}/arch-update-full.desktop" "${pkgdir}/usr/share/applications/arch-update-full.desktop"

  # 3. Ícones globais e do sistema
  install -Dm644 "${srcdir}/novalogov41.png" "${pkgdir}/usr/share/pixmaps/novalogov41.png"
  
  # 4. Ícones do Módulo Sentinela (Faróis de Notificação)
  install -Dm644 "${srcdir}/farol_azul_simbolo.png" "${pkgdir}/usr/share/arch-update-full/icons/farol_azul_simbolo.png"
  install -Dm644 "${srcdir}/farol_amarelo_simbolo.png" "${pkgdir}/usr/share/arch-update-full/icons/farol_amarelo_simbolo.png"
  install -Dm644 "${srcdir}/farol_vermelho_simbolo.png" "${pkgdir}/usr/share/arch-update-full/icons/farol_vermelho_simbolo.png"
  install -Dm644 "${srcdir}/simbolo_tux_kernel_update.png" "${pkgdir}/usr/share/arch-update-full/icons/simbolo_tux_kernel_update.png"
  
}

