# Maintainer: Gabriele <gabrielearchapt>
pkgname=apt-fake-ubuntu-git
pkgver=2.1.dev
pkgrel=1
pkgdesc="Gabriele's Package Manager Bridge - DEVELOPMENT branch (English)"
arch=('any')
url="https://gabrielearchapt.github.io"
license=('GPL3')
depends=('pacman' 'zenity' 'g-helper' 'git')
provides=('apt-fake-ubuntu')
conflicts=('apt-fake-ubuntu')

# Note: We use local sources here. 
# Once you upload 'apt' to a Git repo, change 'source' to the git+https link.
source=('apt' 
        'apt-fake.desktop' 
        'apt-fake.png')
sha256sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
  # Simple date-based versioning for development
  date +%Y.%m.%d.dev
}

package() {
  # Install binary
  install -Dm755 "${srcdir}/apt" "${pkgdir}/usr/bin/apt"
  
  # Install Icon and Desktop file
  install -Dm644 "${srcdir}/apt-fake.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/apt-fake.png"
  install -Dm644 "${srcdir}/apt-fake.desktop" "${pkgdir}/usr/share/applications/apt-fake.desktop"
}
