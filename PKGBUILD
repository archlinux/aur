# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_modulename=taskwiki
pkgname=vim-$_modulename
pkgver=1.0.0
pkgrel=3
pkgdesc="Proper project management in vim. Standing on the shoulders of vimwiki and Taskwarrior"
arch=(any)
url="https://github.com/tbabej/taskwiki"
license=('MIT')
groups=()
depends=('vim' 'python-tasklib' 'task' 'vim' 'vim-vimwiki' 'python-setuptools')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('89e7de650aaaac893871b7ba529adb82402333a3294062ecec297dfe369760a0')

package() {
  cd "$srcdir/$_modulename-$pkgver"
  installpath="${pkgdir}/usr/share/vim/vimfiles"

  install -d $installpath/{after/syntax,doc,extra,ftplugin/vimwiki,taskwiki}
  for x in {after/syntax,doc,extra,ftplugin/vimwiki,taskwiki}
  do
      install -Dm644 $x/* $installpath/$x/
  done
}
