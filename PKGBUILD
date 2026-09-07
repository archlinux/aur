# Maintainer: Brian Bidulock <bidulock@openss7.org>

_basename=gtk-theme-mist
_themename=Mist

pkgname='gtk-theme-mist-git'
pkgver=r141.5822336
pkgrel=1
pkgdesc='GTK 3.x and 4.x theme matching GTK 2.x Mist theme'
url='https://github.com/keithbowes/gtk-theme-mist'
license=(GPL)
arch=(any)
makedepends=(git)

source=("git+https://github.com/keithbowes/$_basename.git")
sha256sums=(SKIP)

pkgver() {
  cd "$_basename"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" \
		  "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_basename"
  install -d "$pkgdir"/usr/share/themes/Mist
  cp -r assets "$pkgdir"/usr/share/themes/Mist
  cp -r index.theme "$pkgdir"/usr/share/themes/Mist
  cp -r gtk-3.20 "$pkgdir"/usr/share/themes/Mist/gtk-3.0
  cp -r gtk-4.16 "$pkgdir"/usr/share/themes/Mist/gtk-4.0
  chmod -R 0644 "$pkgdir"/usr/share/themes/Mist
}
