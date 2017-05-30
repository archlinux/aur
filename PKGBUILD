# Maintainer: Arne Döring <arne.doering at gmx dot net>

pkgname=prompt-hjem-git
_gitname=prompt-hjem
pkgver=31.ad2a670
pkgrel=1
pkgdesc="prompt for zsh"
arch=('any')
url="https://github.com/cornerman/prompt-hjem"
license=('MIT')
depends=('zsh')
#source=('https://github.com/cornerman/prompt-hjem/archive/master.tar.gz')
source=("git://github.com/cornerman/${_gitname}.git")
md5sums=('SKIP')


pkgver() {
	#cd "${_gitname}"
	#git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  cd $srcdir/$_gitname
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
  pwd
  cd $srcdir/$_gitname
  make DESTDIR="$pkgdir/" install
}
