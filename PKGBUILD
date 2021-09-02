# Maintainer: Alex David <flu0r1ne@flu0r1ne.net>
# Contributor: Alex David <flu0r1ne@flu0r1ne.net>

pkgname="planr"
pkgver=0.0.3.r0.g582f484
pkgrel=2
pkgdesc='An open-source, distributed code grading tool for the classroom'
url="https://www.git.flu0r1ne.net/${pkgbase}/about"
arch=('any')
license=('GPL')
depends=('cmake')
makedepends=('git' 'go>=1.60')
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
