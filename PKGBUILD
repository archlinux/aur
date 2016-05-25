# Contributor: Dirk Sohler <spam@0x7be.de>               
# Maintainer: Dirk Sohler <spam@0x7be.de>
# vim: ts=4:sw=4


_releaseVersion='2.9.0'
_sha256='c7dadb6af3feefd4b000c19f96488d3c46c74187701d6577c1d89953cb479181'



pkgname=phpdoc-phar
pkgver=${_releaseVersion}
pkgrel=2
pkgdesc='“Dependency-less” Phar version of phpDocumentor2 (works with PHP 7)'

url='https://www.phpdoc.org/'
arch=('any')
license=('LGPL')

depends=('php')
optdepends=('php-xsl: Needed for some of the rendering templates')
conflicts=('phpdocumentor2')

_baseURL='https://github.com/phpDocumentor/phpDocumentor2/releases/download'
_fileName='phpDocumentor.phar'

source=("${_baseURL}/v${_releaseVersion}/${_fileName}")
sha256sums=("${_sha256}")

pkgver() {
	echo ${_releaseVersion}
}

package() {
	cd "$srcdir"
	install -Dm 755 "${_fileName}" $pkgdir/usr/bin/phpdoc
}
