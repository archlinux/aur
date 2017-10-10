# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_modulename=taskwiki
pkgname=vim-$_modulename
pkgver=0.4
pkgrel=3
pkgdesc="Proper project management in vim. Standing on the shoulders of vimwiki and Taskwarrior"
arch=(any)
url="https://github.com/tbabej/taskwiki"
license=('MIT')
groups=()
depends=('vim' 'python-tasklib' 'task' 'vim' 'vim-vimwiki')
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("${url}/archive/master.tar.gz")
sha256sums=('9d27482056d1c94ec5feb22d8f7d961333e47498ee6779f4874e6fee7630a9b8')
package() {
  cd "$srcdir/$_modulename-master"
  installpath="${pkgdir}/usr/share/vim/vimfiles"

  install -d $installpath/{after/syntax,doc,extra,ftplugin/vimwiki,taskwiki}
  for x in {after/syntax,doc,extra,ftplugin/vimwiki,taskwiki}
  do
      install -Dm644 $x/* $installpath/$x/
  done
}
