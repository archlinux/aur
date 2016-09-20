# Maintainer: Mark Cohen <m@markpcohen.com>

pkgname=v
pkgver=24
pkgrel=1
pkgdesc='z for vim'
arch=('i686' 'x86_64')
url="https://github.com/rupa/v"
optdepends=('vim' 'gvim' 'neovim' 'vim-minimal')
makedepends=('git')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("git://github.com/rupa/${pkgname}.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git rev-list --count HEAD
}

package() {
	cd "$srcdir/$pkgname"
	install -D ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
	install -D -m644 ${pkgname}.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"
}
