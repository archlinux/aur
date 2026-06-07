# Maintainer: VSK11 <your_email@example.com>
pkgname=todo-ratatui-git
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple TUI to-do list manager written in Rust using Ratatui"
arch=('x86_64')
url="https://github.com/vsk11-12/To-do-list-app-based-on-rust"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust' 'cargo' 'git')
provides=('todo-tui')
conflicts=('todo-tui')
source=("git+${url}.git")
md5sums=('SKIP')

build() {
  cd "$srcdir/To-do-list-app-based-on-rust"
  cargo build --release
}

package() {
  cd "$srcdir/To-do-list-app-based-on-rust"
  
  # This line places your newly renamed 'todo' binary into the global system path
  install -Dm755 "target/release/todo" "$pkgdir/usr/bin/todo"
  
  # Installs the license file
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
