# Maintainer: Rootly <arbuzek1488337@gmail.com>
pkgname=dotmaster-git
pkgver=1.0.0
pkgrel=4
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
  # Заходим в папку, которую скачал git
  cd "$srcdir/dotmaster/dotmaster-git"
  # Собираем без --locked, чтобы cargo сам скачал зависимости
  cargo build --release
}

package() {
  cd "$srcdir/dotmaster/dotmaster-git"
  # Устанавливаем скомпилированный бинарник в систему
  install -Dm755 "target/release/dotmaster" "$pkgdir/usr/bin/dotmaster"
}
