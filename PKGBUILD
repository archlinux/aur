# Contributor: muhas <muhas@mail.ru>
pkgname=dscp
pkgver=0.0.1
pkgrel=1
pkgdesc="frontend for scp and ssh (dsh like)"
url="https://github.com/muhas/dscp"
license=("GPL")
depends=('openssh')
makedepends=('git')
arch=('any')
source=()
md5sums=()

_gitdir="dscp"
_giturl="https://github.com/muhas/dscp"
_gitbranch="master"
_commit="6c2c726e2cc36555b8107335e4d06a48e9cd25bc"

build() {
  # Change into source directory
  cd "${srcdir}"

  # Clone or pull from GIT server, and notify user of the status
  msg "Connecting to GIT server...."
  if [[ -d $_gitdir ]] ; then
    cd "$_gitdir" && git pull origin "$_gitbranch"
    msg "The local files are updated."
  else
    git clone "$_giturl" "$_gitdir"
    cd "$_gitdir"
  fi
  git checkout "$_commit"
}

package() {
  cd "$srcdir/$_gitdir"
  cp $pkgname $pkgdir/$pkgname
  chmod +x $pkgdir/$pkgname
}


