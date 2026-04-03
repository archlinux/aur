# Mantenedor: Setimo <gustavo.gianeli@hotmail.com>
pkgname=arch-update-full
pkgver=2.0
pkgrel=1
pkgdesc="Protocolo Cyberpunk: Automatizador de atualizações completas (Pacman, AUR, Flatpak)"
arch=('any')
url="https://github.com/GustavoGianeli/arch-update-full"
license=('MIT')
depends=('pacman' 'yay' 'flatpak')

# --- ADICIONADO O ÍCONE NO SOURCE ---
source=("arch-update-full" 
        "arch-update-full.desktop" 
        "logoarchupdatefull.jpeg")

# Use 'updpkgsums' para preencher isso automaticamente
sha256sums=('66897d77aef2561ce772d0bf0c0a852688676ce362549396d50509df6a0484d8'
            '6b9b7911e0a6054eae02a20c371bfc8b81e4af0cd38aa3a9c4cb37174312c489'
            'f3af0645ddf8e208095b768a11c22af3a621e30a9ffcc8e6d5f4a0aa3ba1a8eb')

package() {
  # 1. Instala o script executável
  install -Dm755 "${srcdir}/arch-update-full" "${pkgdir}/usr/bin/arch-update-full"
  
  # 2. Instala o atalho no menu (GNOME/KDE)
  install -Dm644 "${srcdir}/arch-update-full.desktop" "${pkgdir}/usr/share/applications/arch-update-full.desktop"

  # 3. Instala o ícone no diretório global de imagens do sistema
  install -Dm644 "${srcdir}/logoarchupdatefull.jpeg" "${pkgdir}/usr/share/pixmaps/logoarchupdatefull.jpeg"
}
