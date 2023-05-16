# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='mdsilo-bin'
_pkgname="${pkgname%%-bin}"
pkgver=0.5.6
pkgrel=1
pkgdesc='Local-first, lightweight personal wiki, RSS and podcast client (pre-compiled)'
arch=('x86_64')
#url='https://mdsilo.com/'
url='https://github.com/mdSilo/mdSilo-app'
license=('AGPL3')
depends=(
  'cairo'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'openssl'
  'webkit2gtk'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
  "$url/releases/download/app-v$pkgver/${_pkgname}_${pkgver}_amd64.deb"
)

package() {
  bsdtar -xf "$srcdir/data.tar.gz" -C "$pkgdir"
  chown -R root:root "$pkgdir/usr"
}

sha256sums=(
  'f99bff54e64c8bd93528f77eca10ceecc947649ac1fc1f7127896ff0f57707cc'
)
sha512sums=(
  'db7117c9ce5cb3fb956ebddc2afce37a70090e132d5162fd132665282b1fb27e30416e4cb36fe28763c8fcf69d5ac5be0b275d2e032522e98c4c393d9a1ee4ec'
)
b2sums=(
  'bc283abaac7f5865bc23dc639f9d95833f7fded877a938054a98f4a604dfd5a614cf1391def4540cc4f90a91d950ca39b1bda0454ffd77956ccc6779292cb13d'
)

# eof
