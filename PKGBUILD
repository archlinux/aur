# Maintainer: Thomas Krug <t.krug@elektronenpumpe.de>
# Contributor: Thomas Krug <t.krug@elektronenpumpe.de>

pkgname=labnote2-git
_pkgname=labnote2
pkgver=r54.e9875b0
pkgrel=2
pkgdesc='file based desktop wiki using restructured text or markdown'
arch=('any')
url='https://gitlab.gnome.org/phragment/labnote2'
license=('GPL3')
depends=('python' 'gtk4' 'python-gobject' 'webkitgtk-6.0' 'gtksourceview5' 'python-docutils' 'python-matplotlib')
optdepends=('python-pygments' 'python-myst-parser' 'libspelling' 'xdg-utils' 'perl-file-mimeinfo')
makedepends=('git')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$_pkgname::git+https://gitlab.gnome.org/phragment/labnote2.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  echo r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd "$_pkgname"

  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
