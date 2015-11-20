# Maintainer: maz-1 <ohmygod19993@gmail.com>
pkgname=deadbeef-optimfrog-git
_gitname=deadbeef-optimfrog
pkgver=20151108.g07c8965
pkgrel=1
pkgdesc="OptimFROG input plugin for DeaDBeeF "
arch=('i686' 'x86_64')
url="https://github.com/cspiegel/deadbeef-optimfrog"
license=('custom')
depends=('deadbeef' 'optimfrog')
source=('git+https://github.com/cspiegel/deadbeef-optimfrog.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_gitname"
	echo "$(git show -s --format="%ci"|grep -oP '\d{4}-\d{2}-\d{2}'|sed 's:-::g').g$(git describe --always)"
}


build() {
  cd "${srcdir}/$_gitname"
  make
}

package() {
  cd "${srcdir}/$_gitname"

  install -Dm 755 cas_ofr.so "$pkgdir/usr/lib/deadbeef/cas_ofr.so"
}
