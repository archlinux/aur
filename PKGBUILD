# Maintainer : Jason Raymond Bell <jason@epixxware.com>

_pkgname="vim-clang-format"
pkgname="vim-clang-format-git"
pkgver=1
pkgrel=2
pkgdesc='Plugin which uses clang for formatting C and C++ code. Git version.'
arch=(any)
url='https://github.com/rhysd/vim-clang-format'
license=('MIT')
depends=(vim clang)
makedepends=(git)
conflicts=(vim-clang-format)
source=($_pkgname::git+https://github.com/rhysd/vim-clang-format)
md5sums=(SKIP)
install=${pkgname}.install

package() {
	cd ${srcdir}/${_pkgname}

	# creating directories
	install -d -m 755 ${pkgdir}/usr/share/vim/vimfiles/autoload/operator
	install -d -m 755 ${pkgdir}/usr/share/vim/vimfiles/doc
	install -d -m 755 ${pkgdir}/usr/share/vim/vimfiles/plugin

	# copying files
	install -D -m 644 autoload/clang_format.vim ${pkgdir}/usr/share/vim/vimfiles/autoload/clang_format.vim
	install -D -m 644 autoload/operator/clang_format.vim ${pkgdir}/usr/share/vim/vimfiles/autoload/operator/clang_format.vim
	install -D -m 644 doc/clang-format.txt ${pkgdir}/usr/share/vim/vimfiles/doc/clang-format.txt
	install -D -m 644 plugin/clang_format.vim ${pkgdir}/usr/share/vim/vimfiles/plugin/clang_format.vim
	tail -21 README.md > LICENSE
	install -D -m 644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
