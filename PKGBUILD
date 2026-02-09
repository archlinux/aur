# Maintainer: Joaquín I. Aramendía <samsagax at gmail dot com>

pkgname=gamescope-session-git
_gitdir=gamescope-session
pkgver=r339.b5c2d0d
pkgrel=1
pkgdesc="Common gamescope session files"
arch=('any')
url="https://github.com/OpenGamingCollective/${_gitdir}"
license=('MIT')
groups=()
depends=('gamescope')
makedepends=('git')
optdepends=('mangohud: for performance overlay')
install=gamescope-session.install
source=("${_gitdir}::git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${_gitdir}"

  # Git, no tags available
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${_gitdir}"
  cp -rv "${srcdir}/${_gitdir}/usr" "${pkgdir}/usr"
  install -Dm644 "${srcdir}/${_gitdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
