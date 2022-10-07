# Maintainer: Wu Zhenyu <wuzy01@qq.com>
# https://aur.archlinux.org/packages/updaurpkg-git
# $ updaurpkg --apply
_repo=trishume/syntect
_source_type=github-releases
_upstreamver='v5.0.0'

pkgname=syntest
pkgver=${_upstreamver##v}
pkgrel=1
pkgdesc="Rust library for syntax highlighting using Sublime Text syntax definitions."
arch=(x86_64)
url=https://github.com/$_repo
license=(MIT)
source=("$url/archive/$_upstreamver.tar.gz")
sha256sums=(84c21f8321ebaa794fd740a53a3691daaf3a91fb1be6a04edaf2638855a15fe6)

package() {
  cd "$srcdir/${url##*/}-$pkgver"
  cargo build --release --example syntest
  install -D "target/release/examples/$pkgname" -t "$pkgdir/usr/bin"
}
