# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=verco
pkgver=5.4.1
pkgrel=1
pkgdesc='A simple Git/Hg tui client focused on keyboard shortcuts.'
arch=('i686' 'x86_64')
url="https://github.com/matheuslessarodrigues/verco"
license=('MIT')
depends=()
optdepends=('git: support for git repositories'
            'mercurial: support for mercurial repositories')
conflicts=('verco-git')
makedepends=('cargo')
source=("$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('8a746343da2bcfe0464419d30e1927dcf895dd5c01609075094e8dfb00157139')

build() {
  cd "$pkgname-$pkgver"
  RUSTUP_TOOLCHAIN=stable \
    cargo build --release --locked
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
