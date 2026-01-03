# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='makesure'
pkgver=0.9.26
pkgrel=1
pkgdesc='Simple AWK-based task/command runner with declarative goals and dependencies'
arch=('any')
url='https://github.com/xonixx/makesure'
license=('MIT')  # SPDX-License-Identifier: MIT
depends=('awk' 'sh')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")

_docs='https://makesure.dev/'

package() {
  cd "$pkgname-$pkgver"

  install -vDm0755 -t "$pkgdir/usr/bin" makesure
  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname" \
    CHANGELOG.md README.md docs/*.md
  install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -vDm0644 completion.bash "$pkgdir/usr/share/bash-completion/completions/makesure"
}

sha256sums=(
  '30d1d44966a0268119b879d81a59148bc0d37fc1500b8faf55ad5bd71cf5adba'
)
b2sums=(
  '80fc6d9da1c57f9d38a19b3a0660cb973ce9bc93c5f723ab13f56c90acb62ab44c73305d2860fbb3e96da55c360effefca18b117d49b6d19023ef2cf428b0e4a'
)

# eof
