# Maintainer: suliman altassan <suliman.p2019@gmail.com>

pkgname=alusus
pkgver=0.6.1
pkgrel=2
pkgdesc="ALUSUS PROGRAMMING LANGUAGE - لغة الأسس البرمجية"
arch=('x86_64')
url="https://alusus.org/"
license=('custom')
makedepends=('python' 'python-pip' 'cmake' 'git')

_gitroot="https://github.com/sulimanp/Alusus.git"
_gitname="Alusus"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  cd "$srcdir/$_gitname"

  # BUILD HERE
	mkdir -p opt/Alusus
	./Tools/build.sh --bloc . --iloc opt/Alusus --btype r
}

package() {
  cd "$srcdir/$_gitname"
  cp -r "$srcdir/Alusus/opt/" "$pkgdir/opt/"
}

