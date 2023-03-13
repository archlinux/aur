# Maintainer: AlieZ <aaliezz840@gmail.com>
pkgname=reshade-steam-proton-git
pkgver=r109.e627979
pkgrel=1
pkgdesc='Easy setup and updating of ReShade on Linux for games using wine or proton.'
arch=('any')
url="https://github.com/kevinlekiller/reshade-steam-proton"
license=('GPL2')
depends=('grep' 'p7zip' 'curl' 'git')
optdepends=('wine: Only used if the game uses Vulkan (to insert Windows Registry entries).')
source=('reshade-steam-proton::git+https://github.com/kevinlekiller/reshade-steam-proton.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/reshade-steam-proton"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/reshade-steam-proton"
  install -Dm755 *.sh -t "$pkgdir"/usr/bin/
}
