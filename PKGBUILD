# Contributor: Dirk Sohler <spam@0x7be.de>
# Maintainer: Dirk Sohler <spam@0x7be.de>
# vim: ts=4:sw=4


_releaseVersion='3.6.0'
_sha256='68e860b191799efdd7582b2b5fb738ea4dd743bb0476257608f0b22155d155f3'


pkgname=phpdoc-phar
pkgver=${_releaseVersion}
pkgrel=1
pkgdesc='“Dependency-less” Phar version of phpDocumentor2.'

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
