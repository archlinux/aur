# Maintainer:Erwin-Iosef erwiniosef@gmail.com
pkgname=breeze-dark-red-cursor-git
_curname="Breeze-Dark-Red"
pkgver=r5.fde6070
pkgrel=1
pkgdesc="Breeze Dark Red Cursor Theme by fbm224."
arch=('any')
url="https://store.kde.org/p/2075700"
license=('GPL-3.0-or-later')
source=("git+https://github.com/Erwin-Iosef/Breeze-Dark-Red.git")
makedepends=('git')
sha256sums=('SKIP')

pkgver() {
  cd "$_curname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
    cd "${srcdir}/${_curname}"
    install -dm755 "${pkgdir}/usr/share/icons"
	cp -dr --no-preserve=ownership ${_curname} $pkgdir/usr/share/icons/${_curname}
}
