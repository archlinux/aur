# Maintainer: Tomáš Vyčítal <tom.vycital@gmail.com>

basename=vimix-icon-theme
pkgname=vimix-icon-theme-git
pkgdesc="Fresh and simple personality icon theme."
pkgver=2018.02.02.r1.g6ed2500
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
  install -d -m 755 "$pkgdir/usr/share/icons/vimix"
  install -d -m 755 "$pkgdir/usr/share/icons/paper-vimix"

  cd $srcdir/$basename
  install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/$basename/LICENSE"

  cd "$srcdir/$basename/Vimix"
  cp -r . "$pkgdir/usr/share/icons/vimix/"

  cd "$srcdir/$basename/Paper-Vimix"
  cp -r . "$pkgdir/usr/share/icons/paper-vimix/"
}

# vim: ft=sh ts=2 sw=2 et:
