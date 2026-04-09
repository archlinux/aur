# Maintainer: Jah Way <jahway603 at protonmail dot com>
# Contributor: tarball <bootctl@gmail.com>

pkgname=etesync-knotes
pkgver=3.1
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
sha512sums=('4baf28b2e435ba1844858854bb4559563e1efc80a5a9ec297d9fd09fb9f776f7e8dd11e181c9ef5ba27cd5a23ca01342f99059b4a58d333a8dc4b659a62fd7f6')

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
