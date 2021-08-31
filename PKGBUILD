# Maintainer: Thomas Krug <t.krug@elektronenpumpe.de>
# Contributor: Thomas Krug <t.krug@elektronenpumpe.de>

pkgname=labnote2-git
_pkgname=labnote2
pkgver=r11.0317634
pkgrel=1
pkgdesc='rst based desktop wiki'
arch=('any')
url='https://gitlab.gnome.org/phragment/labnote2'
license=('GPL3')
depends=('python' 'python-gobject' 'webkit2gtk' 'gtksourceview4' 'python-docutils' 'gspell')
optdepends=('python-pygments' 'ttf-droid')
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

  make DESTDIR="$pkgdir" install_desktop
}

# vim:set ts=2 sw=2 et:
