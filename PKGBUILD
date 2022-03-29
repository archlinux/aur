# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='simplex-chat-bin'
_pkgname="${pkgname%%-bin}"
pkgver=1.4.0
pkgrel=1
pkgdesc='A 100% private-by-design chat platform (pre-compiled)'
arch=('x86_64')
_platform='ubuntu-20_04-x86-64'
url='https://simplex.chat/'
_rawurl='https://raw.githubusercontent.com/simplex-chat/simplex-chat/stable'
source=(
  "https://github.com/$_pkgname/$_pkgname/releases/latest/download/$_pkgname-$_platform"
  "$_rawurl/PRIVACY.md"
  "$_rawurl/README.md"
)
license=('AGPL3')
provides=('simplex-chat')
conflicts=('simplex-chat')

package() {
  cd "$srcdir" || exit 1

  install -Dm0755 "$_pkgname-$_platform" "$pkgdir/usr/bin/$_pkgname"

  for doc in {PRIVACY,README}.md; do
    install -Dm0644 "$doc" "$pkgdir/usr/share/doc/$_pkgname/$doc"
  done
}

sha256sums=(
  'eef20e057e6925d4b917fbdf01c0605ae5d8b82fc8b6cd94a930601de7d1fedc'
  'SKIP' 'SKIP'
)
sha512sums=(
  'fedd5e851d200d7a738813fdf359478421fc7eccbd327adbe4f3226b46a5aaea2560f982e8321876e7d0d6c3b0db2326b494dc71a7f832fcf9f1e99cd38ab982'
  'SKIP' 'SKIP'
)
b2sums=(
  '5c19cc4960add94e8cc57b1b8ee804f3ebec5a2303c94455ed0ba13ec26bcfe98bdb68842a0021ad7c1faafd8f8aac68abf765b4781a38d302d85272ee196ac5'
  'SKIP' 'SKIP'
)

# eof
