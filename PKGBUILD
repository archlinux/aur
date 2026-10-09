# Maintainer: The_Seventh <gustavo.gianeli13@gmail.com>
pkgname=post-install-arch-full
pkgver=0.1
pkgrel=1
pkgdesc="Advanced Arch Linux post-installation automation, intelligent multimedia codecs detection, and system setup."
arch=('any')
url="https://github.com/GustavoGianeli/post-install-arch-full"
license=('GPL3')
depends=('bash' 'pacman')


# --- ADICIONADO O ÍCONE NO SOURCE // The icon has been added to the source. ---
source=(
  "post-install-arch-full"	
  "LICENSE"
  "iconeodin.png"
  "post-install-arch-full.desktop"
)

# Use 'updpkgsums' para preencher isso automaticamente // Use 'updpkgsums' to automatically fill this in.

sha256sums=('14e56b6506397038bd4630ae45c1e23381bce8a2411a8f711827fbf88a7195cd'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            '2eaa3fadd7b41d9395bca2dc5ebdc9bd3e206a842a7ee441d0d7be04deb77c59'
            '8529b988d4e3e6ef611ad5ef2124fafa2cbe416b78698c9596845d5471d93651')

package() {

  # 1. Instala o script executável
  install -Dm755 "${srcdir}/post-install-arch-full" "${pkgdir}/usr/bin/post-install-arch-full"
  
  # 2. Instala o atalho no menu
  install -Dm644 "${srcdir}/post-install-arch-full.desktop" "${pkgdir}/usr/share/applications/post-install-arch-full.desktop"

  # 3. Ícones globais e do sistema
  install -Dm644 "${srcdir}/iconeodin.png" "${pkgdir}/usr/share/pixmaps/iconeodin.png"
  
  # 4. Instala a licença GPLv3 obrigatória
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  
}

