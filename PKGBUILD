# Maintainer: Julien Virey <julien.virey+aur@gmail.com>

pkgname=git-mr-git
pkgver=r18.6db756d
pkgrel=1
arch=(any)
pkgdesc="Checkout GitLab merge requests / GitHub pull requests locally"
license=("MIT")
depends=(bash git)
makedepends=(git)
url="https://gitlab.com/glensc/git-mr"
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")

sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "$pkgname"
  install -D git-mr "$pkgdir/usr/bin/git-mr"
  install -D git-pr "$pkgdir/usr/bin/git-pr"
  install -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

