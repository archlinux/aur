# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_modulename=taskwiki
pkgname=vim-$_modulename
pkgver=0.4
pkgrel=4
pkgdesc="Proper project management in vim. Standing on the shoulders of vimwiki and Taskwarrior"
arch=(any)
url="https://github.com/tbabej/taskwiki"
license=('MIT')
groups=()
depends=('vim' 'python-tasklib' 'task' 'vim' 'vim-vimwiki')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("${url}/archive/master.tar.gz")
sha256sums=('425692b75878ae3130e6d6d711612d04a6ddffa7c65a9e0e4cbc76b548354b13')
package() {
  cd "$srcdir/$_modulename-master"
  installpath="${pkgdir}/usr/share/vim/vimfiles"

  install -d $installpath/{after/syntax,doc,extra,ftplugin/vimwiki,taskwiki}
  for x in {after/syntax,doc,extra,ftplugin/vimwiki,taskwiki}
  do
      install -Dm644 $x/* $installpath/$x/
  done
}
