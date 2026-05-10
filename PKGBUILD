# Mantenedor: Setimo <gustavo.gianeli@hotmail.com>
pkgname=arch-update-full
pkgver=3.8
pkgrel=7
pkgdesc="Protocolo Sentinela: Automação de updates (Pacman/AUR/Flatpak/Snap) e auditoria."
arch=('any')
url="https://github.com/GustavoGianeli/arch-update-full"
license=('MIT')
depends=('bash' 'pacman' 'pacman-contrib' 'libnotify' 'procps-ng' 'pciutils' 'coreutils' 'curl' 'wget')
optdepends=('yay: Para suporte a atualizações do AUR (preferencial)'
  'paru: Para suporte a atualizações do AUR (alternativo)'
  'flatpak: Para detecção e atualização de pacotes Flatpak'
  'snapd: Para detecção e atualização de pacotes Snap'
  'reflector: Para otimização automática da lista de mirrors'
)

# --- ADICIONADO O ÍCONE NO SOURCE ---
install=arch-update-full.install

source=("arch-update-full" 
        "arch-update-full.desktop" 
        "sentinela-v38.png"
        "arch-update-full.install")

# Use 'updpkgsums' para preencher isso automaticamente
sha256sums=('3972061141bafc7afd68c97f703866fb808450478a480386f01598e5517fa2ed'
            '28309b7fa80b33589bfdc6ba5a27b057bc6632cddc9c4ede86878d71f6acc65a'
            '2eff2b2b1d6264e951239760610d077a3b5dea39439c9aea86d89188c28d05c8'
            '275f888574b6c24911ce2524acbead50c1da1929ab6b787c62709ed4fb3280e8')

package() {
  # 1. Instala o script executável
  install -Dm755 "${srcdir}/arch-update-full" "${pkgdir}/usr/bin/arch-update-full"
  
  # 2. Instala o atalho no menu (GNOME/KDE)
  install -Dm644 "${srcdir}/arch-update-full.desktop" "${pkgdir}/usr/share/applications/arch-update-full.desktop"

  # 3. Instala o ícone no diretório global de imagens do sistema
  install -Dm644 "${srcdir}/sentinela-v38.png" "${pkgdir}/usr/share/pixmaps/sentinela-v38.png"
}
