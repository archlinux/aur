# Maintainer: MatMoul <matmoul at the google email domain which is .com>

_githubuser=gwenhael-le-moine
_githubrepo=x48ng
#_gitcommit=a8724da1b7e68693102afce2395414a340ac9748
_gitcommit=5263a13833362ab3d1ad889eeb4369c40c60ca04

pkgname=x48ng-git
pkgver=0.22.0.r2.5263a13
pkgrel=1
pkgdesc='A reboot of the x48 HP 48 emulator'
arch=('any')
url="https://github.com/${_githubuser}/${_githubrepo}"
license=('GPL2')
depends=('sdl12-compat' 'sdl_gfx' 'readline')
makedepends=('git')
install="${pkgname}.install"
provides=('x48ng')
conflicts=('x48ng')
source=("git+https://github.com/${_githubuser}/${_githubrepo}.git#commit=${_gitcommit}")
sha256sums=('SKIP')

build() {
	cd "${_githubrepo}"
	make
}

package() {
	cd "${_githubrepo}"
	make DESTDIR="${pkgdir}/" install
        install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/x48ng/LICENSE"
}
