# Maintainer: solnce <echo c29sbmNlQHJhdGFqY3phay5vbmU= | base64 -d>
pkgname=vv-sixel-git
_pkgname=vv
pkgver=1.8.r12.gdd2352e
pkgrel=1
pkgdesc='an image viewer for sixel terminals'
url="https://github.com/hackerb9/${_pkgname}"
source=("git+https://github.com/hackerb9/${_pkgname}")
arch=('any')
license=('GPL3')
depends=('bash' 'imagemagick')
makedepends=('git')
sha256sums=(SKIP)

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm755 vv "${pkgdir}/usr/bin/vv"
}

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
