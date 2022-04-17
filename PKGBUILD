# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='simplex-chat-bin'
_pkgname="${pkgname%%-bin}"
pkgver=1.6.0
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
  '99024d8587a646ba070634a6e1f55154b8a6bfd00dd82caf287f7ab6009404c1'
  'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
)
sha512sums=(
  '986293b1b8e1697dbb4f593172384e09da791563c8d0b1fbd69df5dd1e7f425fd340d9dbf0f0223d8109ebf00171b923125d6cbb0aa4e181dc2dc79042ca370b'
  'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
)
b2sums=(
  '8493e2ef0b51a4fee96d3276be0b4a2f422baf63cf3a0ad6611785d8971ecc66fbf501ac6bd8a4ac33cca6de53c1a4552d708cbd25629fe042e2e66193f6900b'
  'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
)

# eof
