# Maintainer: Ari43 <arirera43 [at] gmail [dot] com>
# Contributor: JarzaClay <icdubs09+aur at gmail dot com>

pkgname=equicord-hook
pkgdesc='Pacman hook to automatically (re)install Equicord when Discord or Equicord updates'
pkgver=r4.162f97a
pkgrel=2
arch=('any')
depends=(
  'bash'
  'coreutils'
  'curl'
  'sed'
  'equicord-installer-bin'
)
source=('git+https://github.com/Ari-43/equicord-autoinstall')
optdepends=('discord: Discord stable branch')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/equicord-autoinstall"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -Dm644 "$srcdir/equicord-autoinstall/equicord-autoinstall.hook" "$pkgdir/etc/pacman.d/hooks/equicord-autoinstall.hook"
  install -Dm755 "$srcdir/equicord-autoinstall/equicord-autoinstall.sh" "$pkgdir/usr/lib/equicord-hook/equicord-autoinstall.sh"
}

