# Maintainer : Nikolai Rodionov <allanger@badhouseplants.net>

_real_name=helm-git
pkgname=${_real_name}-plug
pkgver=1.3.0
pkgrel=1
pkgdesc="Helm Plugin - Install Helm Charts strait from Git repositories "
arch=('any')
url="https://github.com/aslafy-z/helm-git"
license=('MIT')
makedepends=('nodejs' 'npm')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('86aa322083def4f0a5284a8caeebbd548fa9f03b13aca3820d18a3e1033d9d06f3f41ba08fc36fa9ec44a625068065ddfde0c7ac45f84110aa1c2aa94b077bb9')
srcdir=${_real_name}-${pkgver}

package()
{
  cd "${_real_name}-${pkgver}"
  rm -rf tests
  install -Dm755 ./* -t "$pkgdir/usr/lib/helm/plugins/${_real_name##helm-}" 
}
