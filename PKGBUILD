# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=vim-r
pkgver=1.0.0
pkgrel=1
pkgdesc="Vim plugin to work with R"
arch=('any')
url="https://github.com/jalvesaq/${pkgname}"
license=('GPL-2.0-or-later')
groups=('vim-plugins')
depends=('vim-plugin-runtime' 'vim>=8.2.84')
optdepends=('tmux>=2.0: if using vim and running R in an external terminal emulator, necessary for sending commands to R'
            'r>=3.0.0: for integration with R'
	    'pandoc: render output from markup files'
            'vim-csv: inspect data.frames and matrices')
conflicts=('nvim-r' 'r-vimcom')
replaces=('nvim-r')
install='vim-r.install'
source=("$pkgname-$pkgver.tar.gz::https://github.com/jalvesaq/Vim-R/archive/v${pkgver}.tar.gz")
sha256sums=('6cb506afd5a35b23b2ccde5123f0089c088f90570099fbf645292fea4715c185')

package() {
  cd "Vim-R-${pkgver}"
  _installpath="${pkgdir}/usr/share/vim/vimfiles"
  mkdir -p "${_installpath}"
  cp -r {R,doc,ftdetect,ftplugin,syntax} "${_installpath}"
}
