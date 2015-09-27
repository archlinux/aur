# Maintainer: Dobroslaw Kijowski [dobo] <dobo90_at_gmail.com>

pkgname=pfp-vim-git
_pkgname=pfp-vim
pkgver=r13.01195ec
pkgrel=1
pkgdesc='Hex-editor plugin that uses 010 templates to parse binary data using pfp.'
arch=(any)
url=https://github.com/d0c-s4vage/pfp-vim
license=('MIT')
depends=(vim python2-pfp)
source=(git://github.com/d0c-s4vage/pfp-vim.git)
md5sums=(SKIP)

pkgver() {
  cd ${srcdir}/${_pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
  cd ${srcdir}/${_pkgname}

  install -d -m 755 ${pkgdir}/usr/share/vim/vimfiles/{plugin,syntax}

  install -D -m 644 plugin/* ${pkgdir}/usr/share/vim/vimfiles/plugin
  install -D -m 644 syntax/* ${pkgdir}/usr/share/vim/vimfiles/syntax

  install -D -m 644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
