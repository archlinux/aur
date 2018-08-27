# Maintainer: Lothar_m <lothar_m at riseup . net>

pkgname=vim-calendar-git
_pkg_dir=calendar-vim
pkgver=im7ish.r52.g867d0cd
pkgrel=1
epoch=1
pkgdesc='Vim-Calendar creates a calendar window you can use within vim. It is useful in its own right as a calendar-inside-vim. It also provides hooks to customise its behaviour, making it a good basis for writing new plugins which require calendar functionality.'
arch=('any')
url='https://github.com/mattn/calendar-vim'
license=('PublicDomain')
depends=('vim')
makedepends=('git')
conflicts=('vim-calendar')
provides=('vim-calendar')
groups=('vim-plugins')
source=("git+https://github.com/mattn/calendar-vim.git")
sha256sums=('SKIP')

pkgver() {
  cd ${_pkg_dir}
  #git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  git describe --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd ${_pkg_dir}
  #cd ${pkgname%-git}
  _installpath="${pkgdir}/usr/share/vim/vimfiles"
  install -d "${_installpath}/"{autoload,doc,plugin}
  install -m644 autoload/calendar.vim "${_installpath}/autoload/"
  install -m644 doc/calendar.txt "${_installpath}/doc/"
  install -m644 plugin/calendar.vim "${_installpath}/plugin/"
  #install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
