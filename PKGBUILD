# Maintainer: TwoOfTwelve <contact@twooftwelve.de>
# Contributor: William Di Luigi <williamdiluigi@gmail.com>
# Contributor: Tomasz Zok <tomasz dot zok at gmail dot com>

pkgname=jplag
pkgver=6.3.0
pkgrel=1
pkgdesc="JPlag - Detecting Software Plagiarism"
arch=(any)
url="http://www.jplag.de"
license=(GPL3)
depends=('java-runtime>=25')

source=("https://github.com/jplag/JPlag/releases/download/v${pkgver}/jplag-${pkgver}-jar-with-dependencies.jar" jplag)
sha256sums=('5f2c21e8b88ed77134effcb3a5a3ab13d188f6a3e16d401387f7479e92db9aa2'
            'c90ef8f84b16e29e64ec25d3861da4420b43862fc2fab1fd08e9e6c27f9928eb')
noextract=("jplag-${pkgver}-jar-with-dependencies.jar")

package() {
	cd ${srcdir}
	install -D jplag-*-jar-with-dependencies.jar ${pkgdir}/usr/share/java/jplag/jplag.jar
	install -D jplag ${pkgdir}/usr/bin/jplag
}
