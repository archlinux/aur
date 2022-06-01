# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='simplex-chat-bin'
_pkgname="${pkgname%%-bin}"
pkgver=2.2.0
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
  '9f0f161be8712819c0b4a56e95e4191543f4b69441f3d1550fd72a89233dd343'
  'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
)
sha512sums=(
  '4d22128e16eaceefc59d3a4ef9f54ae90a71d45f200df0f9c77102db0deda612fde8045076edfa34c5a2cb233dbaf7ce3bc676944d30cad0640c06a74645a2ee'
  'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
)
b2sums=(
  '36bb9baec99f4aeb54520178a61ee778a7010671f183aceca778216976756546dab017d7f09c2a850ea12f3986bb61bc9e01ca1847b3787bb1756f22c7974fa4'
  'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
)

# eof
