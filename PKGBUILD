# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=verco
pkgver=5.5.1
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
sha256sums=('d60c57d59282a93e174c271946fffb23a799f1586dda2aa03cecf15c06dc11cb')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
