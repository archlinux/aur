# Maintainer: zhullyb <zhullyb@outlook.com>

pkgname=repo-mokee
pkgver=2.13.2
pkgrel=1
pkgdesc="The Multiple Git Repository Tool from the Android Open Source Project"
url="https://github.com/mokee/git-repo"
arch=('any')
license=("APACHE")
depends=("git" "python")
provides=('repo')
conflicts=('repo')
source=("git+https://github.com/MoKee/git-repo.git")

md5sums=("SKIP")

pkgver() {
  cd "${srcdir}/git-repo"
  git describe | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd $srcdir/git-repo
  install -D -m 755 repo "$pkgdir/usr/bin/repo"
  install -D -m 644 docs/manifest-format.md "$pkgdir/usr/share/doc/$pkgname/manifest-format.md"
} 
