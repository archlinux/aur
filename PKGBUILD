# Maintainer: Konstantin Pospelov <kupospelov@gmail.com>
pkgname=feeds-to-instapaper
pkgver=0.2
pkgrel=1
pkgdesc='An application that checks RSS, Atom, or JSON feeds and adds new articles to Instapaper.'
arch=('x86_64' 'i686')
url='https://github.com/kupospelov/feeds-to-instapaper'
license=('MIT')
makedepends=('go' 'make' 'scdoc')
options=('!debug' '!strip' '!emptydirs')
source=("https://github.com/kupospelov/feeds-to-instapaper/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('8444634e12643410fa236b380b696168397df2947c1fd808ef6e4777e87ac36f')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 <(gzip -c "doc/${pkgname}.1") "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"
}
