# Maintainer: Primalmotion <primalmotion at pm dot me>

pkgname=remindme-git
pkgdesc="Simple tool to add remind(1) task using natural language processing"
url="https://git.sr.ht/~primalmotion/remindme"
pkgver=v1.0.1.r0.g3412aee
pkgrel=1
license=(GPL3)
arch=(any)
depends=(remind)
makedepends=(go)
source=("${pkgname}::git+${url}")
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${pkgname}"
	go build -trimpath
}

package() {
	install -Dm755 ${srcdir}/${pkgname}/remindme ${pkgdir}/usr/bin/remindme
}
