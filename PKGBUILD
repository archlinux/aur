# Maintainer: Arjun Vikram <`echo moc.liamg%rua+kivjra | rev | tr '%' '@'`>

_name=groovyserv
pkgname=$_name-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="Quick startup for Groovy programs by using a JVM process running in the background"
arch=('x86_64')
url="https://kobo.github.io/groovyserv/index.html"
license=('APACHE')
provides=('groovyserv')
conflicts=('groovyserv')
depends=('groovy')
optdepends=()
source=("https://bitbucket.org/kobo/${_name}-mirror/downloads/${_name}-${pkgver}-bin.zip")
sha256sums=('88a93e07ce18b7ea33f98dd75ce21550b3a25820dd6eb00ab790f16573317e93')

package() {
	mkdir -p "${pkgdir}/opt/${_name}" "${pkgdir}/usr/bin" "${pkgdir}/usr/share/licenses/${_name}"
	cp -R "${_name}-${pkgver}/lib" "${pkgdir}/opt/${_name}/lib"
	cp -R "${_name}-${pkgver}/platforms/linux_amd64" "${pkgdir}/opt/${_name}/bin"
	ln -s "/opt/${_name}/bin/groovy"{server,client} "${pkgdir}/usr/bin/"
	cp "${_name}-${pkgver}/"*.txt "${pkgdir}/usr/share/licenses/${_name}"
}
