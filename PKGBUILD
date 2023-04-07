# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=editorconfig-gedit-git
pkgver=0.5.3.r196.gd6283d7
pkgrel=1
pkgdesc="EditorConfig plugin for gedit"
arch=('any')
url="https://editorconfig.org/"
license=('BSD')
depends=('gedit' 'python-editorconfig')
makedepends=('git')
provides=("editorconfig-gedit=$pkgver")
conflicts=('editorconfig-gedit')
source=("git+https://github.com/editorconfig/editorconfig-gedit.git")
sha256sums=('SKIP')


pkgver() {
  cd "editorconfig-gedit"

  git describe --long --tags | sed 's/^[A-Za-z]*//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "editorconfig-gedit"

  install -Dm644 {editorconfig.plugin,editorconfig_gedit3.py} -t "$pkgdir/usr/lib/gedit/plugins"
  cp -r "editorconfig_plugin" "$pkgdir/usr/lib/gedit/plugins"

  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/editorconfig-gedit"
}
