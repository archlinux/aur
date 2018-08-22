# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: John D Jones III (jnbek) <https://aur.archlinux.org/account/jnbek>

_npmname=jshint
pkgname=nodejs-${_npmname}
pkgver=2.9.6
pkgrel=1
pkgdesc='Static analysis tool for JavaScript'
arch=('any')
url='http://jshint.com/'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
sha256sums=('d045fff14ac4f15aaf00db6e39bc9fc29a6b9867d496fa6ba6da5a7d59ed03b2')
noextract=("${source[@]##*/}")

package() {
  local _npmdir="${pkgdir}/usr/lib/node_modules/"
  mkdir -p "${_npmdir}"
  cd "${_npmdir}"
  npm install --user root -g --prefix "${pkgdir}/usr" ${_npmname}@${pkgver}
}
