pkgname=pear-net-ldap2
_pkgname=Net_LDAP2
pkgver=2.1.0
pkgrel=2
pkgdesc="Object oriented interface for searching and manipulating LDAP-entries"
url=http://pear.php.net/package/$_pkgname
arch=('any')
license=('PHP')
depends=('php-ldap')
makedepends=('php-pear')
source=(http://download.pear.php.net/package/$_pkgname-$pkgver.tgz)
noextract=($_pkgname-$pkgver.tgz)
md5sums=('d2297dc542e25f7cc998865504a14c4d')

package() {
  cd ${srcdir}
  local _PEARDIR="${pkgdir}/usr/share/pear"
  local _PEAROPTS="-D php_dir=${_PEARDIR} -D doc_dir=${_PEARDIR}/doc"
  local _PEAROPTS="${_PEAROPTS} -D test_dir=${_PEARDIR}/test"
  local _PEAROPTS="${_PEAROPTS} -D data_dir=${_PEARDIR}/data"
  pear ${_PEAROPTS} install -O -n ${_pkgname}-${pkgver}.tgz
  rm -r ${_PEARDIR}/{.channels,.depdb*,.filemap,.lock,.registry}
}

