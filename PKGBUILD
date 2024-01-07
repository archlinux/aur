# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='makesure'
pkgver=0.9.22
pkgrel=1
pkgdesc='Simple AWK-based task/command runner with declarative goals and dependencies'
arch=('any')
url='https://github.com/xonixx/makesure'
license=('MIT')
depends=('awk' 'sh')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")

package() {
  cd "$pkgname-$pkgver"

  # Be more verbose if standard output is a TTY
  test -t 1 && _v='v' || _v=''

  install "-${_v}Dm0755" makesure        "$pkgdir/usr/bin/makesure"
  install "-${_v}Dm0644" completion.bash "$pkgdir/usr/share/bash-completion/completions/makesure"
  install "-${_v}Dm0644" CHANGELOG.md    "$pkgdir/usr/share/docs/$pkgname/CHANGELOG.md"
  install "-${_v}Dm0644" README.md       "$pkgdir/usr/share/docs/$pkgname/README.md"
  install "-${_v}Dm0644" LICENSE         "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=(
  '5d04967232d27e371ebe50f42ac7799e602c313be25012be8a0a275e0dac33ef'
)
b2sums=(
  'dfe468df43753019a9d35d2a73583b92b8acad8e3714b7043e2e42b64ae097fa3341d30533459b8923b289a6112b63467ea15e035a4541806e0830e5af32a522'
)

# eof
