# Maintainer: Maël Kerbiriou <m431.kerbiriou@gmail.com>

pkgname=nix-zsh-completions-git
_pkgname=nix-zsh-completions
pkgver=0.4.3.r2.ga03a558
pkgrel=1
pkgdesc="Additional completion definitions for Zsh"
arch=(any)
url="https://github.com/spwhitt/nix-zsh-completions"
license=(BSD)
depends=(zsh)
makedepends=(git)
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=('git://github.com/spwhitt/nix-zsh-completions.git')
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "${srcdir}/${_pkgname}"
	install -m0644 -Dt "${pkgdir}/usr/share/zsh/site-functions" _*
	install -m0644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}

# vim: set noet ff=unix:
