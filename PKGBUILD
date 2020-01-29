# Contributor: Dirk Sohler <spam@0x7be.de>               
# Maintainer: Dirk Sohler <spam@0x7be.de>
# vim: ts=4:sw=4


_releaseVersion='2.9.1'
_sha256='930cd0e009f83f05d58de2a7c6203f6eb0b330184830ad19af006148265abe43'



pkgname=phpdoc-phar
pkgver=${_releaseVersion}
pkgrel=1
pkgdesc='“Dependency-less” Phar version of phpDocumentor2 (works with PHP 7)'

url='https://www.phpdoc.org/'
arch=('any')
license=('LGPL')

depends=('php')
optdepends=('php-xsl: Needed for some of the rendering templates')
conflicts=('phpdocumentor2')

_baseURL='https://github.com/phpDocumentor/phpDocumentor/releases/download'
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
