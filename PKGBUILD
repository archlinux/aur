# Maintainer: s2ler <aliaksandr at bialiauski dot com>

pkgname=git-sync-git
pkgver=r58.493b015
pkgrel=1
pkgdesc="Safe and simple one-script git synchronization."
arch=('any')
url="https://github.com/simonthum/git-sync"
license=('unknown')
groups=()
depends=('git' 'bash')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
noextract=()
source=('git+https://github.com/simonthum/git-sync.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -Dm755 git-sync "${pkgdir}/usr/bin/git-sync"
}
