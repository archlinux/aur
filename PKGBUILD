# Maintainer: Jah Way <jahway603 at protonmail dot com>
# Contributor: tarball <bootctl@gmail.com>

pkgname=etesync-knotes
pkgver=3.0
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
sha512sums=('ac42d057b6eaa4ab90fe97a4b1d8df8b5d3afbc4d2f502880e0eda915651e8388c745df5bdb85f8f942bf3b6c6c6266104ff6171e403a92a73b53d195348c360')

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
