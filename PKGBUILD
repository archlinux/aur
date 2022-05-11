# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='simplex-chat-bin'
_pkgname="${pkgname%%-bin}"
pkgver=2.0.0
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
  'ef3b43533f7facdbdae8209ca7bc63e8542b6b43e7c15af7ac9f190973762296'
  'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
)
sha512sums=(
  'd5dc219c4c73a9b3cee7e6fae4446044cf0ca85e69e3acbbd6b801a69dbd968ff0e066798a172162ef39f7373c986dcfc6e5176747133aecb6b311bd08a7353e'
  'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
)
b2sums=(
  '2aca4f0a3016e9ccf95179069f881660a3d77eb64082586a2eb3414e58117b975658ddd4bd0d63af19e4961ebb409fe856894a13909523f69c729e1ab659279f'
  'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
)

# eof
