# Maintainer: Mark Cohen <m@markpcohen.com>

_pkgname=v
pkgname=${_pkgname}-git
pkgver=1
pkgrel=1
pkgdesc='z for vim'
arch=('i686' 'x86_64')
url="https://github.com/rupa/v"
optdepends=('vim' 'gvim' 'neovim' 'vim-minimal')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git://github.com/rupa/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	git rev-list --count HEAD
}

package() {
	cd "$srcdir/$_pkgname"
	install -D ${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
	install -D -m644 ${_pkgname}.1 "${pkgdir}/usr/share/man/man1/${_pkgname}.1.gz"
}
