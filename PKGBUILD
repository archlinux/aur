# Maintainer: NEOAPPS <asd22.info@gmail.com>
pkgname=obsidianwall-git
pkgver=r25.e924876
pkgrel=1
pkgdesc="ObsidianOS Wallpaper Compositor"
arch=('any')
url="https://github.com/Obsidian-OS/obsidianwall"
license=('MIT')
depends=('bash' 'imagemagick')
makedepends=('git')
provides=('obsidianwall')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 obsidianwall "$pkgdir/usr/bin/obsidianwall"
}
