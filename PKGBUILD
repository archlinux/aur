# Maintainer: Your Name <your.email@example.com>
pkgname=terminal-love-git
pkgver=r3.e01b624 # ビルド時に自動で最新になります
pkgrel=1
pkgdesc="A terminal-based wave heart CPU/Memory monitor"
arch=('any')
url="https://github.com/kokorodonguri/terminal-love"
license=('MIT')
depends=('python')
makedepends=('git')
provides=("terminal-love")
conflicts=("terminal-love")
source=('git+https://github.com/kokorodonguri/terminal-love.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/terminal-love"
  # GitHubのコミット回数とハッシュからバージョンを自動生成
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/terminal-love"
  # スクリプトを /usr/bin 配下にインストール
  install -Dm755 terminal-love "$pkgdir/usr/bin/terminal-love"
}
