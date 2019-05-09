# Maintainer: Tomáš Vyčítal <tom.vycital@gmail.com>

basename=vimix-icon-theme
pkgname=vimix-icon-theme-git
pkgdesc="Fresh and simple personality icon theme."
pkgver=2019.05.04.r4.g83f08d39
pkgrel=1
conflicts=("$basename")
provides=("$basename")
arch=('any')
url="https://vinceliuice.deviantart.com/art/Vimix-icon-themes-530683384"
license=('custom:CC-BY-SA-4.0')
source=("git+https://github.com/vinceliuice/vimix-icon-theme.git")
sha256sums=('SKIP')

pkgver() {
  cd "$basename"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  install -d -m 755 "$pkgdir/usr/share/icons"
  vimix-icon-theme/install.sh --dest "$pkgdir/usr/share/icons"

  cd "$srcdir/$basename"
  install -D -m 644 COPYING "$pkgdir/usr/share/licenses/$basename/LICENSE"
}

# vim: ft=sh ts=2 sw=2 et:
