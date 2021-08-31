# Maintainer: Alex David <flu0r1ne@flu0r1ne.net>
# Contributor: Alex David <flu0r1ne@flu0r1ne.net>

pkgname="git-update-agent"
pkgver=0.0.5.r2.gc04e2d0
pkgrel=1
pkgdesc='A script for updating code hand off with git'
url="https://www.git.flu0r1ne.net/${pkgbase}/about"
arch=('any')
license=('GPL')
depends=('bash')
makedepends=('git')
source=("git+https://www.git.flu0r1ne.net/${pkgname}")
sha256sums=('SKIP')

pkgver() {
  git -C "${pkgname}" \
    describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  make -C "${pkgname}"
}

package() {
  make -C "${pkgname}" \
    DESTDIR="${pkgdir}/" \
    PREFIX=/usr \
    install 
}
