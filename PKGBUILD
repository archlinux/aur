# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='makesure'
pkgver=0.9.25
pkgrel=1
pkgdesc='Simple AWK-based task/command runner with declarative goals and dependencies'
arch=('any')
url='https://github.com/xonixx/makesure'
license=('MIT')  # SPDX-License-Identifier: MIT
depends=('awk' 'sh')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
changelog="$pkgname.changelog"

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
  '70aae6622577ff1fc9d579f0e35361d4f0fc8bda3f9cf1cb09a73e8d9bb3d2be'
)
b2sums=(
  '00c744ca2e1e37df67e246e7c99473cef92e7063fc699af2d5024825c64e3414302a48e065e0f6e6281489d09a2d356c0e8f55cbc228d76a09f241039c9de1be'
)

# eof
