pkgname=stendhal-bin
_pkgname=stendhal
pkgver=1.4.3
pkgrel=1
pkgdesc="Stendhal is a fun friendly and free multiplayer online adventure game with an old school feel."
arch=('any')
url="https://stendhalgame.org/"
depends=('java-environment-common')
license=('GPL2')
source=("https://arianne-project.org/download/stendhal.zip"
        "stendhal")
sha256sums=('dffeb98c9e8e28265f873f087e2abee74fcb5b0b3874884efc8c044470645d7c'
         '5d29bc01ccc575e62d145d4826d962bc0ade872538c8e5888415b0f98e942aaf')


package() {
	cd ${srcdir}

	mkdir -p ${pkgdir}/opt/${_pkgname}
	cp stendhal-starter.jar ${pkgdir}/opt/${_pkgname}
	cp -r {doc,lib,log} ${pkgdir}/opt/${_pkgname}

	cd ${srcdir}
	install -D -m755 stendhal ${pkgdir}/usr/bin/stendhal
}

