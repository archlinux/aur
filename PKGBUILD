# Maintainer: Mewosiku <meowiik at gmail dot com>
pkgname=environment-overseer-git
pkgver=r127.bbf2bb6
pkgrel=1
pkgdesc="Real time environment manager, used primarily to suppress addictive sites"
arch=('any')
url="https://gitlab.com/meowxiik/environment-overseer"
license=('GPL')
depends=('python')
source=("$pkgname::git+https://github.com/meowxiik/environment-overseer.git/")
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    mv ${srcdir}/${pkgname}/src/overseer.py ${srcdir}/${pkgname}/src/overseer
	install -Dm 755 ${srcdir}/${pkgname}/src/* --target-directory "${pkgdir}/usr/bin/"
	install -Dm 644 ${srcdir}/${pkgname}/systemd/* --target-directory "${pkgdir}/usr/lib/systemd/system"
}
