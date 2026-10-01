# Maintainer: robertfoster

pkgname=websocketd-git
_gitpkg=websocketd
pkgver=.
pkgrel=1
pkgdesc="Like inetd, but for WebSockets. Turn any application that uses STDIO/STDOUT into a WebSocket server."
arch=('x86_64')
url="https://github.com/joewalnes/websocketd"
license=('BSD-2-Clause')
depends=('glibc')
conflicts=('websocketd')
provides=('websocketd')
makedepends=('git' 'mercurial')
source=('websocketd::git+https://github.com/joewalnes/websocketd.git')

build() {
  cd ${_gitpkg}
  make
}

package() {
  cd ${_gitpkg}
  install -Dm755 "${_gitpkg}" "${pkgdir}/usr/bin/${_gitpkg}"
}

pkgver() {
  cd ${_gitpkg}
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

sha256sums=('SKIP')
