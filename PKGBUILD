# Contributor: Dirk Sohler <spam@0x7be.de>
# Maintainer: Dirk Sohler <spam@0x7be.de>
# vim: ts=4:sw=4


_releaseVersion='3.9.0'
_sha256='58c171f3fa5104a2dcde4e1b48823a2d4083e3b02b5fa5f90c362a01ee5086e6'

pkgname=phpdoc-phar
pkgver=${_releaseVersion}
pkgrel=1
pkgdesc='“Dependency-less” Phar version of phpDocumentor2. Compatible with PHP 8.3 and 8.4'

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
