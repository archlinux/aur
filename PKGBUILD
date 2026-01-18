# Maintainer: ldev <ldev at ldev dot eu dot org>

pkgname=no-attention-span-git
pkgver=r5.faa6493
pkgrel=1
pkgdesc='No Attention Span -- Automatically Open/Close TikTok during a long build'
arch=(x86_64)
url=https://github.com/xgames123/nas
license=(MIT)
depends=()
makedepends=(cargo)
source=("$pkgname::git+$url.git")
md5sums=('SKIP')

pkgver()  {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$pkgname"
  cargo build --release
}

package() {
  install -Dm0755 "$pkgname/target/release/nas" "$pkgdir/usr/bin/nas"
}
