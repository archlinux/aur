# Maintainer: willemw <willemw12@gmail.com>

pkgname=git-tools-git
pkgver=2022.12.r6.gfaba1cd
pkgrel=1
pkgdesc='Assorted git tools, including git-restore-mtime'
arch=(any)
url=https://github.com/MestreLion/git-tools
license=(GPL-3.0-or-later)
depends=(git python)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  git -C $pkgname describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  install -Dm644 $pkgname/README.md -t "$pkgdir/usr/share/${pkgname%-git}"

  install -Dm644 $pkgname/man1/git-*    -t "$pkgdir/usr/share/man/man1/"

  #install -Dm755 $pkgname/git-*     -t "$pkgdir/usr/lib/git-core/"
  install -Dm755 $pkgname/git-*     -t "$pkgdir/usr/bin/"
}
