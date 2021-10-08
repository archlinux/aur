# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname='atto-bin'
_pkgname=${pkgname%-bin}
pkgver=1.4.0
pkgrel=1
_atto_ver=1.3.0
_atto_safesign_ver=1.1.0
pkgdesc='A tiny Nano wallet, focused on ease of use through simplicity'
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
md5sums=(
  '134583686ea2af5e9f4fb486a12b4bb4'
  '0a93c6724fe3ed8547fd42946008ba07'
  'SKIP'
  'SKIP'
)
sha1sums=(
  'e16feb48e80a266cf67c45d043a67e138eae9f93'
  '007d8f9efb74f2cf791dea52d9797e84c5feb303'
  'SKIP'
  'SKIP'
)
sha256sums=(
  '063bdeda80cccd5dad115ed2a2936174e1b448fa025c0d262d755d6ec913a8b5'
  '41ecc25fe11fe71f7b0847336f34b14dfe10a7a0e9a2cc5a1a6170c5a3a692c3'
  'SKIP'
  'SKIP'
)
sha512sums=(
  '947ae6f23a8591b3c132e82510b48ec421fbe0c563537e94088a94767cf5ab34573495c4e6417cb147db292179f3f583b5c925be645c79e28fba5a4e8ebd19c5'
  '4393b7d0131470b81df0711cc61e7c1b82f7ce6b6913dfb54b40891eb2eba34f7b5d4d8c2d8abc67debbd2c7e728aec113baca6f52265b8ec53fdab1ccc02d83'
  'SKIP'
  'SKIP'
)
b2sums=(
  '0ccccd2c6a0aa0eb374660705387a0a1bcf17b1a00b73c7434b34007339d57ffecfb1c4b0349e08abb274f25461fefe2edc41b89dd67d220f76c7c9c7ba383c0'
  '26650b8b611ac97761f488fc21ab324b8cd1c6ce7b2148778902bcc54a6f20f0b4e45890b1516e7378b23f49631254f2e02d7a16f01c1dc7375de55a0f51e615'
  'SKIP'
  'SKIP'
)

package() {
  cd "$srcdir" || exit 1

  for cmd in atto{,-safesign}; do
    install -Dm0755 "$cmd" "$pkgdir/usr/bin/$cmd"
  done
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 LICENSE   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# eof
