#Maintainer: Anthony Ruhier <anthony.ruhier@gmail.com>

_pkgname=net-ipv6
pkgname=php-$_pkgname
pkgver=1.3.0b3
pkgrel=1
pkgdesc="Check and validate IPv6 addresses"
arch=("any")
url="https://pear.php.net/package/Net_IPv6/"
license=("PHP")
depends=("php>=5.4.0")
makedepends=("php-pear")
options=("!strip" "!emptydirs")
source=("http://download.pear.php.net/package/Net_IPv6-${pkgver}.tgz")
sha256sums=('2b804dc88cd5928da86ef7a8b1bec072b991a492233445fb151f39186d80110b')

package() {
    cd "${srcdir}"
    local _PEARDIR="${pkgdir}/usr/share/pear"
    local _PEAROPTS=(-D php_dir="${_PEARDIR}" -D doc_dir="${_PEARDIR}/doc")
    local _PEAROPTS+=(-D test_dir="${_PEARDIR}/test")
    local _PEAROPTS+=(-D data_dir="${_PEARDIR}/data")

    pear "${_PEAROPTS[@]}" install -O -n "Net_IPv6-${pkgver}.tgz"
    rm -r "${_PEARDIR}"/{.channels,.depdb*,.filemap,.lock,.registry}
}
