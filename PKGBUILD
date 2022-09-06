# Maintainer: ffqq <shuttara@gmail.com>
pkgname=zaura-git
_pkgname=zaura
pkgver=0.1.2
pkgrel=1
pkgdesc="A bash library for utilizing the AUR inside bash scripts."
arch=('any')
url="https://gitea.com/ffqq/zaura"
license=('GPL3')
depends=('pacman' 'git' 'jq')
optdepends=('sudo')
provides=($_pkgname)
source=("$pkgname::git+https://gitea.com/ffqq/zaura.git")
md5sums=("SKIP")

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$srcdir/$pkgname"
	mkdir -p ${pkgdir}/usr/share/${_pkgname}
	install -D -m755 "${_pkgname}" "${pkgdir}/usr/share/${_pkgname}/${_pkgname}"
}
