_gitname=clawspeek
pkgname=${_gitname}-git
pkgver=8.881c15a
pkgver() { cd $_gitname && echo $(git rev-list --count master).$(git rev-parse --short master); }
pkgrel=1
pkgdesc="Decode obfuscated claws-mail passwords (see ~/.clawsmail/accountrc)"
arch=('i686' 'x86_64')
url="https://github.com/mones/clawspeek"
license=('GPL3')
makedepends=('git' 'make' 'gcc')
provides=('clawspeek')
conflicts=('clawspeek')
source=('git://github.com/mones/clawspeek.git')
md5sums=(SKIP)

build() {
  cd $_gitname
  make
}

package() {
  cd $_gitname
  make PREFIX=$pkgdir/usr install
}
