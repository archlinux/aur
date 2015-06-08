# Maintainer : dobo <dobo90_at_gmail.com>

pkgname=vim-conque-gdb
pkgver=0.12
pkgrel=1
pkgdesc='GDB command line interface and terminal emulator in (G)Vim.'
arch=(any)
url='http://www.vim.org/scripts/script.php?script_id=4582'
license=(MIT)
depends=(vim)
conflicts=(vim-conque)
source=(https://github.com/vim-scripts/Conque-GDB/archive/0.12.tar.gz
        LICENSE)
md5sums=(a88d31ea4a07606813a97f0aad51aabd
         c2b2de5a0549e68e5048a8329218d12c)

package() {
  cd ${srcdir}/Conque-GDB-${pkgver}

  # create directories and copy all files
  install -d -m 755 ${pkgdir}/usr/share/vim/vimfiles
  install -d -m 755 ${pkgdir}/usr/share/licenses/${pkgname}
  install -D -m 644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  cp -r . ${pkgdir}/usr/share/vim/vimfiles

  # fix permissions
  cd ${pkgdir}/usr/share/vim/vimfiles
  rm README
  find . -type d -exec chmod 755 {} \;
  find . -type f -exec chmod 644 {} \;
}
