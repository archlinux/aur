_pkgname=vim-snakemake
pkgname=$_pkgname-git
pkgver=r18.d0015a0
pkgrel=1
pkgdesc="Vim syntax for Snakemake snakefiles"
arch=('any')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/raivivek/$_pkgname"
license=('MIT')
source=("$_pkgname::git+https://github.com/raivivek/$_pkgname.git")
sha256sums=('SKIP')
provides=("$_pkgname")
conflicts=("$_pkgname")

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_pkgname"
  find ftdetect ftplugin indent snippets syntax \
		-type f -exec install -Dm644 '{}' \
    "$pkgdir/usr/share/vim/vimfiles/{}" \;
}
