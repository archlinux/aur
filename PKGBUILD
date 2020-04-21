#Maintainer: Anthony Ruhier <anthony.ruhier@gmail.com>

_pkgname=net-ipv4
pkgname=php-$_pkgname
pkgver=1.3.5
pkgrel=1
pkgdesc="IPv4 network calculations and validation"
arch=("any")
url="https://pear.php.net/package/Net_IPv4/"
license=("PHP")
depends=("php>=5.4.0")
makedepends=("php-pear")
options=("!strip" "!emptydirs")
source=("http://download.pear.php.net/package/Net_IPv4-${pkgver}.tgz")
sha256sums=('3e843c9b1901e8f6b6fd6dbcebf87b52b0ac4a41cb8a6bafb8d02d8e502e6438')

package() {
    cd "${srcdir}"
    local _PEARDIR="${pkgdir}/usr/share/pear"
    local _PEAROPTS=(-D php_dir="${_PEARDIR}" -D doc_dir="${_PEARDIR}/doc")
    local _PEAROPTS+=(-D test_dir="${_PEARDIR}/test")
    local _PEAROPTS+=(-D data_dir="${_PEARDIR}/data")

    pear "${_PEAROPTS[@]}" install -O -n "Net_IPv4-${pkgver}.tgz"
    rm -r "${_PEARDIR}"/{.channels,.depdb*,.filemap,.lock,.registry}
}
