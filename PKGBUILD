# Maintainer : dobo <dobo90_at_gmail.com>

__pkgname="vim-clang"
pkgname="${__pkgname}-git"
pkgver=0.6.r0.g739c9d4
pkgrel=1
pkgdesc='Yet another vim plugin which uses clang for accurately completing C and C++ code. Git version.'
arch=(any)
url='https://github.com/justmao945/vim-clang'
license=(custom)
depends=(vim clang)
makedepends=(git)
conflicts=('vim-clang-complete' 'vim-clang-complete-git')
source=(git+https://github.com/justmao945/vim-clang)
md5sums=(SKIP)

pkgver() {
	cd ${__pkgname}
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd ${__pkgname}

	install -d -m 755 ${pkgdir}/usr/share/vim/vimfiles/plugin
	install -d -m 755 ${pkgdir}/usr/share/vim/vimfiles/doc
	install -D -m 644 doc/clang.txt ${pkgdir}/usr/share/vim/vimfiles/doc/clang.txt
	install -D -m 644 plugin/clang.vim ${pkgdir}/usr/share/vim/vimfiles/plugin/clang.vim
}
