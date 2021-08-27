# Contributor: Dirk Sohler <spam@0x7be.de>
# Maintainer: Dirk Sohler <spam@0x7be.de>
# vim: ts=4:sw=4


_releaseVersion='3.1.1'
_sha256='d69720d7a9fe865b1ee753dc74253226d7994b8e3618ab8b32c843c9ef44d3b5'


pkgname=phpdoc-phar
pkgver=${_releaseVersion}
pkgrel=1
pkgdesc='“Dependency-less” Phar version of phpDocumentor2. Works with PHP 8.'

url='https://www.phpdoc.org/'
arch=('any')
license=('LGPL')

depends=('php')
optdepends=('php-xsl: Needed for some of the rendering templates')
conflicts=('phpdocumentor2')

_baseURL='https://github.com/phpDocumentor/phpDocumentor/releases/download'
_fileName='phpDocumentor.phar'

source=(
    "${_baseURL}/v${_releaseVersion}/${_fileName}"
)

sha256sums=(
    "${_sha256}"
)

pkgver() {
    echo ${_releaseVersion}
}

package() {
    cd "$srcdir"
    install -Dm 755 "${_fileName}" $pkgdir/usr/bin/phpdoc
}
