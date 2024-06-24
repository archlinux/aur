# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Thomas Schneider <maxmusterm@gmail.com>

pkgname=rgss_script_editor-git
pkgver=54_e7483ee
pkgrel=3
pkgdesc="Script editor for Scripts.rxdata (RPG Maker XP)"
url="https://github.com/Ancurio/rgss_script_editor"
arch=('any')
license=('MIT')
depends=('qscintilla-qt5' 'zlib' 'gcc-libs' 'qt5-base' 'glibc')
makedepends=('cmake' 'git')
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
  install -Dm0644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
