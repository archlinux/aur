# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='mdsilo-bin'
_pkgname="${pkgname%%-bin}"
pkgver=0.5.7
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
  'libsoup'
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
  'a70d0fa49072da91a2ddbee28f824620cd9d80d4a267502e7724f4c02175b194'
)
b2sums=(
  '63eaaf828f2f5befad5dab87238725d92c015b82f37d28f9048f15bac5aa3c0989bf04cf6e9100bb1fd510272fd15af9df580bc21601cc1b159d7a652c6d0ed5'
)

# eof
