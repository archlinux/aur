# Mantenedor: Setimo <gustavo.gianeli@hotmail.com>
pkgname=arch-update-full
pkgver=3.8
pkgrel=5
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
        "logoarchupdatefull.png"
        "arch-update-full.install")

# Use 'updpkgsums' para preencher isso automaticamente
sha256sums=('3972061141bafc7afd68c97f703866fb808450478a480386f01598e5517fa2ed'
            '2536fedb2447879b8c09ba774fa1db34f9c2c7e76b0a7de5daf9991ef644f18d'
            '5dcf6e7ebd55c8fff84a6e62bb486c1e4c5b5f311180c4c78e5231bd4f3a2462'
            '275f888574b6c24911ce2524acbead50c1da1929ab6b787c62709ed4fb3280e8')

package() {
  # 1. Instala o script executável
  install -Dm755 "${srcdir}/arch-update-full" "${pkgdir}/usr/bin/arch-update-full"
  
  # 2. Instala o atalho no menu (GNOME/KDE)
  install -Dm644 "${srcdir}/arch-update-full.desktop" "${pkgdir}/usr/share/applications/arch-update-full.desktop"

  # 3. Instala o ícone no diretório global de imagens do sistema
  install -Dm644 "${srcdir}/logoarchupdatefull.png" "${pkgdir}/usr/share/pixmaps/logoarchupdatefull.png"
}
