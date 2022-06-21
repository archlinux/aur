# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname='tuc-bin'
_pkgname=${pkgname%%-bin}
pkgver=0.11.0
pkgrel=2
pkgdesc='A more powerful alternative to cut, when cut doesn’t cut it (pre-compiled)'
arch=('x86_64')
url='https://github.com/riquito/tuc'
_rawurl='https://github.com/riquito/tuc/raw/master'
license=('GPL3')
source=(
  "$url/releases/download/v$pkgver/tuc-linux-amd64"
  "$url/releases/download/v$pkgver/tuc-regex-linux-amd64"
  "$_rawurl/CHANGELOG.md"
  "$_rawurl/README.md"
  "$_rawurl/doc/tuc.1"
)
provides=("$_pkgname")
conflicts=("$_pkgname")

package() {
  cd "$srcdir" || exit 1

  for tuc in tuc-{,regex-}linux-amd64; do
    install -Dm0755 "$tuc" "$pkgdir/usr/bin/${tuc%%-linux-amd64}"
  done

  for mdname in {CHANGELOG,README}.md; do
    install -Dm0644 "$mdname" "$pkgdir/usr/share/doc/$pkgname/$mdname"
  done

  install -Dm0644 tuc.1 "$pkgdir/usr/share/man/man1/tuc.1"
}

sha256sums=(
  'a5f89e14404a65b1fb9c1c3b043c581e06ae357a7758b19cb9f12d5a95882b3b'
  '450336bd519049c633cc00e388dbb01e31b945dbbc53e4a31b9a5516f6432711'
  'SKIP' 'SKIP' 'SKIP'
)
sha512sums=(
  '156cacf805c76d5e230dc84d85f99034638537f8da9a68fbeaaafa50fb5d270ad903beada676699449fafb552f950c06163d14e9444ca12a5e7441835d026ecd'
  'ad9fc8fa8602dd98ebe37ef4c37f4c7cc494c1e08066bc18a253a5b5f1f08cb2776b6bc9619928ed7c479eeb77631b3bb4a45d6acf02dfbbd093ee885aaaad08'
  'SKIP' 'SKIP' 'SKIP'
)
b2sums=(
  '76645ecde0c76b8c3de3c2dd08def048403b2342774d8c7bc8850c0483cb12757d461ff1bfca76ea94eb9124f3a6827d71e2112eaad7a9537325e8df6d96ec25'
  'd3b4b010b29ab3c1d5f8f7de7b60d53f1c547c8ca935a4312a43b2df7a7dbb06eaa9b56a42828ceb461a051dcb90cd309e08479314992a5335401e6d9702b135'
  'SKIP' 'SKIP' 'SKIP'
)

# eof
