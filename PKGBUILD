# Maintainer: Evilleader <evilleader91@gmail.com>
pkgname=gameflow-deck-git
pkgver=1.7.0
pkgrel=1
pkgdesc="A tool for managing games on your deck"
arch=('x86_64')
url="https://github.com/simeonradivoev/gameflow-deck"
license=('MIT')
depends=('nodejs' 'sqlite') # bun usually depends on node or is a standalone binary
makedepends=('git' 'bun')
provides=('gameflow-deck')
conflicts=('gameflow-deck')
source=("git+${url}.git")
sha256sums=('SKIP')

build() {
  cd "gameflow-deck"
  
  # Install dependencies
  bun install
  
  # Build the project
  bun run build:prod
}

package() {
  cd "gameflow-deck"
  
  # Install the compiled artifacts
  # Note: Adjust these paths based on where 'bun run build:prod' puts the output
  install -d "${pkgdir}/opt/${pkgname}"
  cp -r build/* "${pkgdir}/opt/${pkgname}/"
  
  # Symlink and icon logic (same as your previous successful build)
}
