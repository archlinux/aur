#Maintainer: giniu < gginiu@gmail.com >

pkgname=vim-languagetool
pkgver=1.29
_scriptid=3223
_srcid=23923
pkgrel=1
pkgdesc="Grammar checker for English, French, German (etc.) in Vim"
arch=(any)
url="http://www.vim.org/scripts/script.php?script_id=${_scriptid}"
license=('custom')
depends=('vim' 'languagetool')
makedepends=('unzip')
groups=('vim-plugins')
install=vimdoc.install

source=(LanguageTool.zip::http://www.vim.org/scripts/download_script.php?src_id=${_srcid}
        languagetool.patch license.txt)
md5sums=('abed1473f70c9c471f1cd5e58eadb1b0'
         'a315ba8727e49c2db80eacd2445fabf7'
         'f49a1270c8ead84829517d3a625e1d83')

build() {
  cd "${srcdir}"

  patch -p0 < languagetool.patch
}

package() {
  cd "${srcdir}"

  install -Dm755 doc/LanguageTool.txt "${pkgdir}"/usr/share/vim/vimfiles/doc/LanguageTool.txt
  install -Dm755 plugin/LanguageTool.vim "${pkgdir}"/usr/share/vim/vimfiles/plugin/LanguageTool.vim
  install -Dm755 license.txt "${pkgdir}"/usr/share/licenses/${pkgname}/license.txt
}

