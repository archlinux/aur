# Contributor: Dirk Sohler <spam@0x7be.de>
# Maintainer: Dirk Sohler <spam@0x7be.de>
# vim: ts=4:sw=4


_releaseVersion='3.9.1'
_sha256='ef5509af790c8e56d11fff8162f12c7c19473b9af6e79b0fb9a62aff26da2ea5'

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
