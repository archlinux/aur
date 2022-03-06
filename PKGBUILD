# Maintainer: Cristian Gutierrez <cristian@crstian.me>

_pkgname=pokeget
pkgname=pokeget-git
pkgver=1.1.r7.gc1fc8a9
pkgrel=1
pkgdesc="Pokeget is a bash script you can use to display cool sprites of pokemon in your terminal. "
arch=('any')
url="https://github.com/talwat/pokeget"
license=('MIT')
depends=('bash')
makedepends=('git')
source=("git+https://github.com/talwat/pokeget.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --tags --long | sed -r -e 's,^[^0-9]*,,;s,([^-]*-g),r\1,;s,[-_],.,g'
}

package() {
  cd "${_pkgname}"


  install -Dm755 pokeget "${pkgdir}/usr/bin/pokeget"
  
}
