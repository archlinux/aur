#Maintainer: M0Rf30

pkgname=websocketd-git
_gitpkg=websocketd
pkgver=147.fbda5f2
pkgrel=1
pkgdesc="Like inetd, but for WebSockets. Turn any application that uses STDIO/STDOUT into a WebSocket server."
arch=('i686' 'x86_64')
url="https://github.com/joewalnes/websocketd"
license=('BSD')
depends=('glibc')
conflicts=('websocketd')
makedepends=('git' 'mercurial')
source=('websocketd::git+https://github.com/joewalnes/websocketd.git')

build() {
  cd ${_gitpkg}
  make
}

package(){
  cd ${_gitpkg}
  install -Dm755 "${_gitpkg}" "${pkgdir}/usr/bin/${_gitpkg}"
}

pkgver() {
  cd ${_gitpkg}
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

md5sums=('SKIP')
