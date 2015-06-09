# Maintainer Thomas Schneider <maxmusterm@gmail.com>

pkgname=rgss_script_editor-git
pkgver=47
pkgrel=2
pkgdesc="Script editor for Scripts.rxdata (RPG Maker XP)"
url="https://github.com/Ancurio/rgss_script_editor"
arch=('any')
license=('MIT')
depends=('qscintilla')
optdepends=()
makedepends=('qscintilla' 'cmake' 'git')
source=("git+https://github.com/Ancurio/rgss_script_editor.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/rgss_script_editor"
  echo "$(git rev-list --count HEAD)"_"$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/rgss_script_editor"
  cmake ./ -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/rgss_script_editor"
  install -Dm755 bin/rgss_script_editor "$pkgdir/usr/bin/rgss_script_editor"
}

# vim:set ts=2 sw=2 et:
