# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='simplex-chat-bin'
_pkgname="${pkgname%%-bin}"
pkgver=3.1.0
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
provides=('simplex-chat')
conflicts=('simplex-chat')

package() {
  cd "$srcdir" || exit 1

  install -Dm0755 "$_pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"

  for doc in {PRIVACY,README,CLI,SIMPLEX,SQL}.md; do
    install -Dm0644 "$doc" "$pkgdir/usr/share/doc/$_pkgname/$doc"
  done

  install -Dm0644 message_views.sql "$pkgdir/usr/share/doc/$_pkgname/message_views.sql"
}

sha256sums=(
  '91087554c784735756a837b96c0ca127c0890711882d8d07b02a466b3aff567d'
  'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
)
sha512sums=(
  '01d64cbfccfeabd909da281131894377423e4f824ea8fd701b6945ec51b35ebe9c57038425897a87c1fb6192fe9371dd1405af898be7cfd194addd3f22ffc73d'
  'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
)
b2sums=(
  '4c0ee20d8135fce574aa584f23defc69006e767eba4e9811cdee3cc99e77ea830858c4d4a0ed43bf6891849975db54a2d18b1c62d8534a6509da6fa544c357b8'
  'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
)

# eof
