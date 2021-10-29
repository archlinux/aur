# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname='atto-bin'
_pkgname=${pkgname%%-bin}
pkgver=1.4.1
pkgrel=1
_atto_ver=1.4.0
_atto_safesign_ver=1.2.0
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
md5sums=(
  '5cfe06da0720c1fd0b321dd661826f5b'
  '25197de3b60485cec3e40bd9f033c85a'
  'SKIP' 'SKIP'
)
sha1sums=(
  'ba7b1782f442f4d0c8b8e04dc2f89f32116575be'
  'a95df08ff6b330ed3847da7370ef12173f6e5f07'
  'SKIP' 'SKIP'
)
sha256sums=(
  'd263cf403aee0add44bb8b5442b89c7b7a8b4b0e1f9e0c861fe7bb2a815b310e'
  'a337a70e3868a45f12e29a68d6cb19c61186e27652e37cebfcb6dd1a7b0abd85'
  'SKIP' 'SKIP'
)
sha512sums=(
  'bb5a56a29b0d323b6099b17c94494933dbebdc74ed16305ed8af6c4e9e90edd20eb405aa9f38a69bdfd7c42311254a97924100048d26535557413282ea2ceb6a'
  '818e2a105cf2d126b6540deb3b720c37bac736ffb829cf2d2739d787e3831420d2bf8433ffa288760038de3b40545d631d28c7d1d0db7751bff189bed0bdb446'
  'SKIP' 'SKIP'
)
b2sums=(
  '321f19560e01d96f8b4df58119e287d5fd16fff637efc630246a02298bb30959eeecee07179e641fa3a41cce74f7b7b10658028b9ec56efd61ee4b2c9560610b'
  '0146167b7f0eda6909afddde1f153a27b4713b4cf6931dbcc0f169b7a79f05936c2c222cb93857496974723cf04fca9a7dd486d10aa6454d8672ff17f3e0f17e'
  'SKIP' 'SKIP'
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
