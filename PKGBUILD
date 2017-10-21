# Maintainer: Pochang Chen <johnchen902@gmail.com>

pkgname=vim-html5-git
pkgver=0.27.r176.g916085d
pkgrel=1
pkgdesc="Vim HTML5 omnicomplete and syntax"
arch=('any')
url="https://github.com/othree/html5.vim"
license=('MIT')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
conflicts=('vim-html5')
provides=('vim-html5')
source=('git+https://github.com/othree/html5.vim.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/html5.vim"
  git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "${srcdir}/html5.vim"
	installpath="${pkgdir}/usr/share/vim/vimfiles"

	mkdir -p ${installpath}
	cp -r after autoload ftplugin indent syntax ${installpath}

	#just in case... make sure it's all 644
	find ${installpath} -type f -exec chmod 644 {} \;
}
