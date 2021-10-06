# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname='atto-bin'
_pkgname=${pkgname%-bin}
pkgver=1.3.0
pkgrel=2
_atto_ver=1.2.1
_atto_safesign_ver=1.0.0
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
  '42ddb0132fa20f4249889402bc10fb7b'
  '67b7513c027155422b6a2ad0b78dcf0b'
  'SKIP'
  'SKIP'
)
sha1sums=(
  'db76ad30de4edf296d1d47c130bfcc8f0c640bf8'
  '3daaaf65853c08e6bea26ec5918897406ec0837c'
  'SKIP'
  'SKIP'
)
sha256sums=(
  '79dd0e2ed8d6cd5c85fea83b015f2416f1267baf0d97f58e7890749968e867f7'
  'a245eab521b302b60dade71f21ea532a5fe25faad0249c7cb643913c1637f810'
  'SKIP'
  'SKIP'
)
sha512sums=(
  'aebff41fa26881d12f3a5c7d95c1f0bd5a83f183388440ad66f407c4e58dd3643b0d0a7544afe03deedcd770f6c6b4470085f128fdc0414e0a045dbca07b9d02'
  'b4deebea67e4a178ff5bab3ef000c099b8488a6567877926103d4629f9d1660b5df7f1882807be44ecef95fd42301ba89a5e3b35e734feddea28caed1634cd0a'
  'SKIP'
  'SKIP'
)
b2sums=(
  '4b8db1762eda6c48c5ffdd4316265af6a823ff90237f4a45b8e315f128394ae1d77454e0fb848ce12403a6790963e53fab7b3a0c7b5824206fdbb8ecdf5dd49a'
  '1b54471fb77c4771b765cefc6628b7c3e2b468101178b1fc411563abe527d8e303e0c712393f5f49b4220f8b8f6a6601eba2b5478f4e7281254bf721fff18054'
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
