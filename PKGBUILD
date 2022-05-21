# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='simplex-chat-bin'
_pkgname="${pkgname%%-bin}"
pkgver=2.1.0
pkgrel=2
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
  '40ba25d6f416a7b683113f3396c50dd5fa97436756730cbb4d9348e42d6f34ae'
)
sha512sums=(
  'caa6ad015b06b5db94794e073b1fcc5b6550167b7a3d191c3832b028ff7d746b64db79042a2e8ab945df697c5fdd1dd79aa99b27e2549c8f6cf266d3252f2a01'
  'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
)
b2sums=(
  '7fa64898c1c72d876b935d9fca828751042370871f3777ae4b163ec99e1b967d8472e3a9f2527a3e205b0de243d891f4b4d8b8903180e07895a6359eaec8ea5e'
  'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
)

sha256sums=(
  'f46792f40a856400dbabe32fd556c4a64bfe47416e62cc7480d59c2974a4fd02'
  'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
)
sha512sums=(
  '0d2c909d4dafa21710713d8907c43fa2ade04b1680342cad0402a8f867c2ff4e729bdd3a5933bb8427bb003615ebdcc218c92b475c7a7da8839542ffc87a41fe'
  'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
)
b2sums=(
  '4b78cf694b813bc020091139dd4b35a40130757eac53f89dfe55259460514d86e590353e1cfed43a4938f86728a294279eae15e5670e8516a98e802444bcc713'
  'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
)

# eof
