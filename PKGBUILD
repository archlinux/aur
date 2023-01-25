# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='simplex-chat-bin'
_pkgname="${pkgname%%-bin}"
pkgver=4.4.4
pkgrel=1
pkgdesc='A 100% private-by-design chat platform (pre-compiled)'
arch=('x86_64')
_platform='ubuntu-20_04-x86-64'
url='https://simplex.chat/'
_rawurl='https://raw.githubusercontent.com/simplex-chat/simplex-chat/master'
source=(
  "$_pkgname-$pkgver::https://github.com/$_pkgname/$_pkgname/releases/download/v$pkgver/$_pkgname-$_platform"
  "$_rawurl/PRIVACY.md"
  "$_rawurl/README.md"
  "$_rawurl/docs/CLI.md"
  "$_rawurl/docs/SIMPLEX.md"
  "$_rawurl/docs/SQL.md"
  "$_rawurl/scripts/message_views.sql"
)
license=('AGPL3')
depends=(
  'gmp'
  'openssl-1.1'
  'zlib'
)
provides=('simplex-chat')
conflicts=('simplex-chat')

package() {
  cd "$srcdir" || exit 1

  install -Dm0755 "$_pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
  install -Dm0644  message_views.sql "$pkgdir/usr/share/doc/$_pkgname/message_views.sql"
  install  -m0644 {PRIVACY,README,CLI,SIMPLEX,SQL}.md "$pkgdir/usr/share/doc/$_pkgname/"
}

sha256sums=(
  'b47477c3ad18a5375f0dcaf2aba89866b481de733969631cf97b872c9c78cab7'
  'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
)
sha512sums=(
  '772a604db30b839cb335910977c10288e26206ebc461ff7d8fc8dfe79606e18eeacb8897169410e45bd42ef1b488ce6d9ddfc638c03c0fd51ef3978a5c69c6d4'
  'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
)
b2sums=(
  '71db6d9a61c3331641570b716c4cd1f0feb54b3b35fd0bcc613e3c0bbe7802daaf0d6a8ed0849ef78376419644b8f599fdff74dc803e9472cf81ca51b63a32ee'
  'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
)

# eof
