# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='simplex-chat-bin'
_pkgname="${pkgname%%-bin}"
pkgver=4.5.0
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
  'c606de59273e68c7c5aaaef6da6c11e50fcf361c11ca7179bd51192d79a3595f'
  'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
)
sha512sums=(
  '17b2c0b1d88d03e50d185313dc31c7170618a221e78a1cdd3ab80a50d95c572f4e6043c3a5ee5d730701e8eb7438e35a1c084ab4c2618941f01291dcc6eae416'
  'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
)
b2sums=(
  'b559da2bf7ea96ccd4b754f77b40ac5fa8d07309e5d9bca2326be9abbb35bde6e2038868092301cf33b9753ab37848869eda2c87e18962fff1bb954d1a38a462'
  'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
)

# eof
