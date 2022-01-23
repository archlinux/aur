# Maintainer: ffqq <shuttara@gmail.com>
pkgname=liteaur-git
_pkgname=liteaur
pkgver=1.7.1
pkgrel=1
pkgdesc="Shell-based AUR helper"
arch=('any')
url="https://gitea.com/ffqq/liteaur"
license=('GPL3')
depends=('pacman' 'git' 'jq')
optdepends=('sudo')
provides=($_pkgname)
source=("$pkgname::git+https://gitea.com/ffqq/liteaur.git")
md5sums=("SKIP")

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$srcdir/$pkgname"
	install -D -m755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
