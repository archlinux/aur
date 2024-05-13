# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>

pkgname='makesure'
pkgver=0.9.23
pkgrel=2
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
    CHANGELOG.md README.md
  install -vDm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=(
  'd9f7f1ca17bc584ee312f2d597546813a6577235ef24cdd0f15fa7c0a1b52b15'
)
b2sums=(
  '80192bd71555182f21a3fff2333c7f984642d58af532acc614f23b7813e98d6ac27d4858951f9e81e64dc1d161bd8f7f79b591c263f1e452389987c463961e9c'
)

# eof
