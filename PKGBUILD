# Maintainer: roger <roger@rogerpc.com.ar>

pkgname=escrotum-git
pkgver=0.2.1.r31.g094b288
pkgrel=1
pkgdesc="Screen capture using pygtk, inspired by scrot"
arch=('i686' 'x86_64')
url="https://github.com/Roger/escrotum"
license=('GPL3')
groups=()
depends=('python2' 'python2-distribute' 'pygtk')
makedepends=('git' 'python2-setuptools')
optdepends=('python2-numpy: fast image generation')
provides=('escrotum=0.1.0')
source=('git://github.com/Roger/escrotum.git')
md5sums=('SKIP')

_gitname="escrotum"

pkgver() {
  cd $_gitname
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd $_gitname
  # install
  msg "Running setup.py"
  python2 setup.py install --root="${pkgdir}" --prefix=/usr
  install -d "${pkgdir}/usr/share/man/man1"
  install man/escrotum.1 "${pkgdir}/usr/share/man/man1"
}
