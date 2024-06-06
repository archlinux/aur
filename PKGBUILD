_gitdir=gamescope-session-opengamepadui
pkgname=opengamepadui-session-git
pkgver=r22.f9aafe5
pkgrel=1
pkgdesc="Gamescope session for running OpenGamepadUI"
arch=('any')
url="https://github.com/ShadowBlip/${_gitdir}"
license=('GPL')
depends=('gamescope' 'gamescope-session-git')
provides=('opengamepadui-session' 'gamescope-session-opengamepadui')
makedepends=('git')
source=("${_gitdir}::git+${url}.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${_gitdir}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${_gitdir}"
  cp -rv ${srcdir}/${_gitdir}/usr ${pkgdir}/usr
}
