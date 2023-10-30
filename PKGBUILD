_gitdir=gamescope-session-steam-plus
pkgname=${_gitdir}-git
pkgver=r1.6835776
pkgrel=1
pkgdesc="Gamescope session for running OpenGamepadUI in overlay mode with Steam"
arch=('any')
url="https://github.com/ShadowBlip/${_gitdir}"
license=('GPL')
depends=('gamescope' 'gamescope-session-git' 'gamescope-session-steam-git')
provides=('gamescope-session-steam')
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
