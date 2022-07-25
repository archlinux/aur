# Maintainer: Primalmotion <primalmotion at pm dot me>

pkgname=remindme
pkgdesc="Simple tool to add remind(1) task using natural language processing"
url="https://git.sr.ht/~primalmotion/remindme"
pkgver=v1.2.0
pkgrel=1
license=(GPL3)
arch=(any)
depends=(remind)
makedepends=(go pandoc)
source=("https://git.sr.ht/~primalmotion/remindme/archive/${pkgver}.tar.gz")
sha1sums=('cdccd544e407507a927bfddc773c14c3f6ff0c09')
provides=("remindme")

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make remindme
	make man
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	PREFIX=${pkgdir}/usr make install
}
