# Contributor: Dirk Sohler <spam@0x7be.de>
# Maintainer: Dirk Sohler <spam@0x7be.de>
# vim: ts=4:sw=4


_releaseVersion='3.0.0'
_sha256='8d16e500d6d3d0e28c06ec77c5bca55c6270db97091c53ff32873725d2f7f6d2'



pkgname=phpdoc-phar
pkgver=${_releaseVersion}
pkgrel=2
pkgdesc='“Dependency-less” Phar version of phpDocumentor2. Works with PHP 7 only. Currently upstream does not provide PHP 8 support in regular releases.'

url='https://www.phpdoc.org/'
arch=('any')
license=('LGPL')

depends=('php7')
optdepends=('php7-xsl: Needed for some of the rendering templates')
conflicts=('phpdocumentor2')

_baseURL='https://github.com/phpDocumentor/phpDocumentor/releases/download'
_fileName='phpDocumentor.phar'

source=(
    "${_baseURL}/v${_releaseVersion}/${_fileName}"
    'php7_info.install'
    'php7_starter.sh'
)
sha256sums=(
    "${_sha256}"
    'bd80293550c28b0c57e2e86044ebe00f6ae281708787a01c4a174a042cf18acd'
    'd3a4b7b38be1e2f78a6e449beb606e295c7e65222dee477b98a4a40f25919291'
)
install='php7_info.install'

pkgver() {
    echo ${_releaseVersion}
}

package() {
    cd "$srcdir"
    install -Dm 644 "${_fileName}" $pkgdir/usr/share/phpdoc/phpdoc.phar
    install -Dm 755 "php7_starter.sh" $pkgdir/usr/bin/phpdoc
}
