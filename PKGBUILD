# Maintainer: Raymond W. Ko <raymond.w.ko@gmail.com>

pkgname=gtk-theme-clearlooks-flat-compact-git
pkgver=r17.e115648
pkgrel=1
pkgdesc="Clearlooks-flat-compact theme for GTK2, GTK3, metacity, and openbox"
provides=("gtk-theme-clearlooks-flat-compact")
conflicts=("gtk-theme-clearlooks-flat-compact")
arch=('any')
url="https://github.com/linvinus/Clearlooks-flat-compact"
license=('GPL')
makedepends=('git')
# The git repo is detected by the 'git:' or 'git+' beginning.
#source=('git+https://github.com/falconindy/expac.git'
# The repo is cloned into '$pkgname' (optional).
source=("$pkgname"::'git+https://github.com/linvinus/Clearlooks-flat-compact')
# Because the sources are not static, skip Git checksum:
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  # Use the tag of the last commit
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  pwd
}

package() {
  pwd
  echo $pkgdir
  mkdir -p "$pkgdir/usr/share/themes/Clearlooks-flat-compact"
  cd "$srcdir/$pkgname"
  mv * "$pkgdir/usr/share/themes/Clearlooks-flat-compact"
}
