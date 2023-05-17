# Maintainer: William Di Luigi <williamdiluigi@gmail.com>
# Maintainer: Tomasz Zok <tomasz dot zok at gmail dot com>

pkgname=jplag
pkgver=4.3.0
pkgrel=1
pkgdesc="JPlag - Detecting Software Plagiarism"
arch=(any)
url="http://www.jplag.de"
license=(GPL3)
depends=('java-runtime>=17')

source=("https://github.com/jplag/JPlag/releases/download/v${pkgver}/jplag-${pkgver}-jar-with-dependencies.jar" jplag)
sha256sums=('85925b179d6626f1e2d5ff1ce269e636f33a392a8b66e51cc8cf90a383021049'
            'c90ef8f84b16e29e64ec25d3861da4420b43862fc2fab1fd08e9e6c27f9928eb')
noextract=("jplag-${pkgver}-jar-with-dependencies.jar")

package() {
	cd ${srcdir}
	install -D jplag-*-jar-with-dependencies.jar ${pkgdir}/usr/share/java/jplag/jplag.jar
	install -D jplag ${pkgdir}/usr/bin/jplag
}
