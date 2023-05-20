# Maintainer: user <matmoul at the google email domain which is .com>

_githubuser=gwenhael-le-moine
_githubrepo=x48ng
_pkgtagname=0.12.0

pkgname=x48ng
pkgver=0.12.0
pkgrel=1
pkgdesc='A reboot of the x48 HP 48 emulator'
arch=('any')
url="https://github.com/${_githubuser}/${_githubrepo}"
license=('GPL2')
depends=('readline' 'libxext' 'xterm' 'xorg-mkfontscale' 'xorg-fonts-misc')
install="${pkgname}.install"
source=("${_githubrepo}::https://github.com/${_githubuser}/${_githubrepo}/archive/refs/tags/${_pkgtagname}.tar.gz")
sha256sums=('ad59aa5f0730ccaab66a5703ff4ade75d7dc74da9d77be2ee6ec54d58afe99bd')

build() {
	cd "${_githubrepo}-${pkgver}"
	make
}

package() {
	cd "${_githubrepo}-${pkgver}"
	make DESTDIR="${pkgdir}/" install
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
