# Maintainer : Nikolai Rodionov <allanger@zohomail.com>

_real_name=helm-git
pkgname=${_real_name}-plug
pkgver=0.15.1
pkgrel=1
pkgdesc="Helm Plugin - Install Helm Charts strait from Git repositories "
arch=('any')
url="https://github.com/aslafy-z/helm-git"
license=('MIT')
makedepends=('nodejs' 'npm')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('e5c9d3804dc86f93fa42d30839a96943b98a711c1e64181162f8cdaac6057017df90fae495ad9cdc9a3ea07b3802132e4e782c88f3be50ea6eebe6f4d3220cae')
srcdir=${_real_name}-${pkgver}

package()
{
  cd "${_real_name}-${pkgver}"
  rm -rf tests
  install -Dm755 ./* -t "$pkgdir/usr/lib/helm/plugins/${_real_name##helm-}" 
}
