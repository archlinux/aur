# Maintainer: MatMoul <matmoul at the google email domain which is .com>

_githubuser=gwenhael-le-moine
_githubrepo=x48ng
_gitcommit=f1ceb684f4b3b7d60340712caf84b54fca788b3d

pkgname=x48ng-git
pkgver=0.12.0.r6.f1ceb68
pkgrel=1
pkgdesc='A reboot of the x48 HP 48 emulator'
arch=('any')
url="https://github.com/${_githubuser}/${_githubrepo}"
license=('GPL2')
depends=('readline' 'libxext' 'xterm' 'xorg-mkfontscale' 'xorg-fonts-misc')
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
