# Maintainer: Jah Way <jahway603 at protonmail dot com>
# Contributor: tarball <bootctl@gmail.com>

pkgname=etesync-knotes
pkgver=3.2
pkgrel=1
arch=('x86_64')
url='https://codeberg.org/Josselin_Beaumont/Etesync-Knotes'
pkgdesc='Secure Etesync note-taking application with Etebase for encrypted synchronization'
license=('GPL-3.0-or-later')
depends=(
  'gcc-libs'
  'glib2'
  'glibc'
  'hicolor-icon-theme'
  'libetebase'
  'libsecret'
  'openssl'
  'qt6-base'
)
makedepends=('cmake')
source=("$url/archive/v$pkgver.tar.gz")
sha512sums=('c91edfda234b834970222e1574a474b4356a4281fc71c753b078f635f4cc55ea3f09265ebf7765439c0a504c05779c30a97622fded7582ae650908ae34683f0e')

build() {
  cd $pkgname
  make
}

package() {
  cd $pkgname
  make PREFIX="$pkgdir/usr" install

  install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  rm -f "$pkgdir/usr/share/applications/mimeinfo.cache"
  rm -f "$pkgdir/usr/share/icons/hicolor/icon-theme.cache"
}
