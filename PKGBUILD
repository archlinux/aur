# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname='atto-bin'
_pkgname=${pkgname%%-bin}
pkgver=1.5.0
pkgrel=1
_atto_ver=1.5.0
_atto_safesign_ver=1.3.0
pkgdesc='A tiny Nano wallet, focused on ease of use through simplicity (pre-compiled)'
arch=('x86_64')
url='https://github.com/codesoap/atto'
_rawurl='https://raw.githubusercontent.com/codesoap/atto'
license=('MIT')
provides=('atto')
conflicts=('atto')
source=(
  "$pkgname-$_atto_ver.tar.gz::$url/releases/download/v$pkgver/atto_${_atto_ver}_Linux_amd64.tar.gz"
  "$pkgname-safesign-$_atto_safesign_ver.tar.gz::$url/releases/download/v$pkgver/atto-safesign_${_atto_safesign_ver}_Linux_amd64.tar.gz"
  "LICENSE::$_rawurl/master/LICENSE"
  "README.md::$_rawurl/master/README.md"
)

package() {
  cd "$srcdir" || exit 1

  for cmd in atto{,-safesign}; do
    install -Dm0755 "$cmd" "$pkgdir/usr/bin/$cmd"
  done

  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 LICENSE   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=(
  'c1d19cf2e3b83c26a51ad66650ff9f896eeff6be9183608c861304745dcd6194'
  'b9c1d9b76e603ba580d636cec217ba105e3f68865c5fb6e9624028fd8a7346dd'
  'SKIP' 'SKIP'
)
sha512sums=(
  'ee41adfab6d3acb9d90b1f78954822030039270edaf7ba9e277ba0019f14412188d59690ea98225dfbd64d82990242b06e805c805eb04fb04defbf1174bb2eaa'
  'ae9bd1a2182dc6364ae97a7d139b124f5fc355421c50b523aedf9f5ab1a5771bfdb629999815824d85fbc85e46ffb8789d7ed844902e212b77d01c043edc5bfe'
  'SKIP' 'SKIP'
)
b2sums=(
  'ffe3f4e7c77aac83a1d301f24ced9bc3188f1178e9d24a79f865d4a6b0c930bc37eb4170eb53d501f99b6492e94c76791e3b0334b3f91126841ca931eba60dc6'
  'e3c05acf62938ce4b3d92a2967ae9fb701c10347363d4f1308cdb5040c944beecb6578203ec374b585d33c802263812a3119a6a69b64163b253c7f1a2bf7cd61'
  'SKIP' 'SKIP'
)

# eof
