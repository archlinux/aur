# Maintainer: Rootly <arbuzek1488337@gmail.com>
pkgname=dotmaster-git
pkgver=1.0.0
pkgrel=2
pkgdesc="Interactive dotfiles installer written in Rust"
arch=('x86_64')
url="https://github.com/Minish777/dotmaster"
license=('MIT')
depends=('gcc-libs' 'git')
makedepends=('cargo')
provides=('dotmaster')
conflicts=('dotmaster')
source=('git+https://github.com/Minish777/dotmaster.git')
sha256sums=('SKIP')

build() {
  # В git-репозиториях папка обычно называется по имени репо
  cd "$srcdir/dotmaster/dotmaster-git"
  cargo build --release --locked
}

package() {
  cd "$srcdir/dotmaster/dotmaster-git"
  # Бинарник лежит в папке target/release внутри подпапки проекта
  install -Dm755 "target/release/dotmaster" "$pkgdir/usr/bin/dotmaster"
}