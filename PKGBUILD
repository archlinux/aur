#Maintainer: M0Rf30

pkgname=fakeuser-git
pkgver=8.2f456e0
pkgrel=1
pkgdesc="LD_PRELOAD module to create fake users (use with fakeroot)"
arch=('i686' 'x86_64')
url="https://github.com/progandy/fakeuser"
license=('GPL3')
depends=(openssl)
makedepends=('git')
source=('fakeuser::git+https://github.com/progandy/fakeuser.git')

build() {
  cd fakeuser
  make
}

package(){
  cd fakeuser

  install -m 0755 -d "$pkgdir/usr/lib/"
  install -m 0644 libfakeuser.so "$pkgdir/usr/lib/"
  install -m 0755 -d "$pkgdir/usr/lib/"
  install -m 0755 -d "$pkgdir/usr/bin/"
  install -m 0755 fakeuser "$pkgdir/usr/bin/"
  install -m 0755 fakeadd "$pkgdir/usr/bin/"
}

pkgver() {
  cd fakeuser
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

md5sums=('SKIP')
