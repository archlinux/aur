# Mantenedor: Setimo <gustavo.gianeli@hotmail.com>
pkgname=arch-update-full
pkgver=3.5
pkgrel=2.5
pkgdesc="Protocolo Sentinela: Automação de updates (Pacman/AUR/Flatpak/Snap) e auditoria."
arch=('any')
url="https://github.com/GustavoGianeli/arch-update-full"
license=('MIT')
depends=('pacman' 'flatpak' 'bash' 'libnotify') 
optdepends=('yay: Injeção AUR' 'snapd: Suporte Snap' 'reflector: Mirror Sync')

# --- ADICIONADO O ÍCONE NO SOURCE ---
source=("arch-update-full" 
        "arch-update-full.desktop" 
        "logoarchupdatefull.png")

# Use 'updpkgsums' para preencher isso automaticamente
sha256sums=('133e2cf3949daa9155b023eb05db65e2edd37f78d78d7882ea418eb03d19008d'
            'c67f2145975aef77b7bc07a71ff334593df456ffe8155175f177f0e73f4f47cd'
            'efacea25c42c5656350fa9a1ec9a0bd528f4ca3305457c6d82814472f178862b')

package() {
  # 1. Instala o script executável
  install -Dm755 "${srcdir}/arch-update-full" "${pkgdir}/usr/bin/arch-update-full"
  
  # 2. Instala o atalho no menu (GNOME/KDE)
  install -Dm644 "${srcdir}/arch-update-full.desktop" "${pkgdir}/usr/share/applications/arch-update-full.desktop"

  # 3. Instala o ícone no diretório global de imagens do sistema
  install -Dm644 "${srcdir}/logoarchupdatefull.png" "${pkgdir}/usr/share/pixmaps/logoarchupdatefull.png"
}
