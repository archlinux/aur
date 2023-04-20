# Maintainer: William Di Luigi <williamdiluigi@gmail.com>
# Maintainer: Tomasz Zok <tomasz dot zok at gmail dot com>

pkgname=jplag
pkgver=4.2.0
pkgrel=1
pkgdesc="JPlag - Detecting Software Plagiarism"
arch=(any)
url="http://www.jplag.de"
license=(GPL3)
depends=('java-runtime>=17')

source=("https://github.com/jplag/JPlag/releases/download/v${pkgver}/jplag-${pkgver}-jar-with-dependencies.jar" jplag)
sha256sums=('a494161302d228cca46530660f34485d7713c9c3ce999ba82c9d80465829a31c'
            'c90ef8f84b16e29e64ec25d3861da4420b43862fc2fab1fd08e9e6c27f9928eb')
noextract=("jplag-${pkgver}-jar-with-dependencies.jar")

package() {
	cd ${srcdir}
	install -D jplag-*-jar-with-dependencies.jar ${pkgdir}/usr/share/java/jplag/jplag.jar
	install -D jplag ${pkgdir}/usr/bin/jplag
}
