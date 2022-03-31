# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='simplex-chat-bin'
_pkgname="${pkgname%%-bin}"
pkgver=1.4.1
pkgrel=3
pkgdesc='A 100% private-by-design chat platform (pre-compiled)'
arch=('x86_64')
_platform='ubuntu-20_04-x86-64'
url='https://simplex.chat/'
_rawurl='https://raw.githubusercontent.com/simplex-chat/simplex-chat/stable'
source=(
  "https://github.com/$_pkgname/$_pkgname/releases/download/v$pkgver/$_pkgname-$_platform"
  "$_rawurl/PRIVACY.md"
  "$_rawurl/README.md"
)
license=('AGPL3')
provides=('simplex-chat')
conflicts=('simplex-chat')
sha256sums=(
  '7c8edd51821ad48d51f13d7852f0bb66e7070af88048405bf1a2244c084bb7f3'
  'SKIP' 'SKIP'
)
sha512sums=(
  'f69e94c46e89f3813103392e62da4d2732388b1b236d39d4eb5f1b53e11ba70414e298d070a12d29c11a33c8804c932e01d315e19be8b216b5443b583657b051'
  'SKIP' 'SKIP'
)
b2sums=(
  'a74802c500a4af697f3d8250b40c6a8245a88ac00c854d8a10a833a87b0ce630c982d3751216df4d86a316d933556266f338cea44f238833a68589600c086659'
  'SKIP' 'SKIP'
)

package() {
  cd "$srcdir" || exit 1

  install -Dm0755 "$_pkgname-$_platform" "$pkgdir/usr/bin/$_pkgname"

  for doc in {PRIVACY,README}.md; do
    install -Dm0644 "$doc" "$pkgdir/usr/share/doc/$_pkgname/$doc"
  done
}

# eof
