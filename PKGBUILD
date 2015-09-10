# Maintainer: kaptoxic <kaptoxic _at_ yahoo _dot_ com >
# Contributor: kaptoxic <kaptoxic _at_ yahoo _dot_ com >

pkgname=gnome-shell-tracker-search-provider-git
pkgver=r26.da08e64
pkgrel=1
pkgdesc="Gnome-shell extension for displaying tracker search results in the shell overview"
arch=('any')
url="https://github.com/hamiller/tracker-search-provider"
license=('GPL2')
depends=('gnome-shell' 'tracker' 'gobject-introspection')
install=gschemas.install
source=("$pkgname"::'git+https://github.com/hamiller/tracker-search-provider.git#branch=gnome_16')
md5sums=('SKIP')

#_gitroot="git://github.com/hamiller/tracker-search-provider"
#_gitname="tracker-search-provider"

package() {
  cd "$srcdir/$pkgname"
  ext_dir="tracker-search-provider@sinnix.de"
  
  mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/"$ext_dir""
  cp -r * "$pkgdir/usr/share/gnome-shell/extensions/"$ext_dir""
  
  # Give regular user permissions to parent directory and files as settings get stored here
  # not sure if this is needed
  #chmod -R 0666 "$pkgdir/usr/share/gnome-shell/extensions/"$ext_dir""
  #chmod    0777 "$pkgdir/usr/share/gnome-shell/extensions/"$ext_dir""
}

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# vim:set ts=2 sw=2 et: