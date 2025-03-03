# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='makesure'
pkgver=0.9.24
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

  install -vDm0755 makesure "$pkgdir/usr/bin/makesure"
  install -vDm0644 completion.bash "$pkgdir/usr/share/bash-completion/completions/makesure"
  install -vDm0644 -t "$pkgdir/usr/share/docs/$pkgname/" \
    CHANGELOG.md README.md docs/*.md
  install -vDm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=(
  '444b0666fbff948624baae92c3673fe12c01484901c75269e0d3651e982b54e0'
)
b2sums=(
  'dc3f6a34eb3a0f98e44bae6bd0e7169e343d978306147aab204b04f3fd6ef1e26af190ba06bfffe43ad81f5c6bfeec237b6c9c92233c69d3e83edb75944b5d17'
)

# eof
