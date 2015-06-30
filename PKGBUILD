# Maintainer: roger <roger@rogerpc.com.ar>

pkgname=escrotum-git
pkgver=39.a756b2e
pkgrel=1
pkgdesc="Linux screen capture using pygtk, inspired by scrot"
arch=('i686' 'x86_64')
url="https://github.com/Roger/escrotum"
license=('GPL3')
depends=('python2' 'python2-distribute' 'pygtk')
makedepends=('git')
provides=('escrotum=0.1.0')
source=('git://github.com/Roger/escrotum.git')
md5sums=('SKIP')

_gitname="escrotum"

pkgver() {
  cd $_gitname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd $_gitname
  # install
  msg "Running setup.py"
  python2 setup.py install --root=${pkgdir} --prefix=/usr
}
