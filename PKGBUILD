# Mantenedor: Setimo <gustavo.gianeli@hotmail.com>
pkgname=arch-update-full
pkgver=3.7
pkgrel=4
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
sha256sums=('5e6d9c9618cb0ce6a2f60496d63f444bad3b86c4bffe618c79ba8dd17149fbc5'
            'c67f2145975aef77b7bc07a71ff334593df456ffe8155175f177f0e73f4f47cd'
            'e0732656a868f19e30dd46069bc68389962facc464470f3238de188e8fffcaa5'
            '275f888574b6c24911ce2524acbead50c1da1929ab6b787c62709ed4fb3280e8')

package() {
  # 1. Instala o script executável
  install -Dm755 "${srcdir}/arch-update-full" "${pkgdir}/usr/bin/arch-update-full"
  
  # 2. Instala o atalho no menu (GNOME/KDE)
  install -Dm644 "${srcdir}/arch-update-full.desktop" "${pkgdir}/usr/share/applications/arch-update-full.desktop"

  # 3. Instala o ícone no diretório global de imagens do sistema
  install -Dm644 "${srcdir}/logoarchupdatefull.png" "${pkgdir}/usr/share/pixmaps/logoarchupdatefull.png"
}
