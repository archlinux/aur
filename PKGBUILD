# Maintainer:  Javier Torres <javitonino [at] gmail [dot] com>
# Contributor: max-k <max-k AT post DOT com>

pkgname=pear-net-url2
_pkgname=Net_URL2
pkgver=2.2.0
pkgrel=3
pkgdesc='Class for parsing and handling URL'
arch=('any')
url="http://pear.php.net/package/${_pkgname}"
license=('BSD')
depends=('php>=5.0' 'php-pear>=1.4.0b1')
makedepends=()
options=('!strip')
noextract=(${_pkgname}-${pkgver}.tgz)
source=(http://download.pear.php.net/package/${_pkgname}-${pkgver}.tgz)
md5sums=('a6fdb5869aef4814cd154137cc961e5f')

package() {
  cd ${srcdir}
  local _PEARDIR="${pkgdir}/usr/share/pear"
  local _PEAROPTS="-D php_dir=${_PEARDIR} -D doc_dir=${_PEARDIR}/doc"
  local _PEAROPTS="${_PEAROPTS} -D test_dir=${_PEARDIR}/test"
  local _PEAROPTS="${_PEAROPTS} -D data_dir=${_PEARDIR}/data"
  pear ${_PEAROPTS} install -O -n ${_pkgname}-${pkgver}.tgz
  rm -r ${_PEARDIR}/{.channels,.depdb*,.filemap,.lock,.registry/.chan*}
}

