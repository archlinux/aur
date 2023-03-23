# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Filipe Bertelli <filipebertelli@tutanota.com>

_pkgbase=hardhat
pkgname="${_pkgbase}"
pkgdesc='Ethereum development environment for professionals'
pkgver=2.13.0
pkgrel=1
arch=('any')
_ns="NomicFoundation"
url="https://github.com/${_ns}/${_pkgbase}"
license=('custom')
depends=('nodejs')
makedepends=('npm')
source=(http://registry.npmjs.org/$_pkgbase/-/$_pkgbase-$pkgver.tgz)
noextract=($_pkgbase-$pkgver.tgz)
sha512sums=('665cc138b30bd501a59ba256c95006f25553100a0e6959b58a7fd1536ce81809d81280f5469e13f9932facb3611da69e4bd85f8c9d6025405f883af8731fa1b5')

package() {
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$_pkgbase-$pkgver.tgz
  rm -fr "$pkgdir"/usr/etc

  # Fix npm derp
  find "$pkgdir/usr" -type d -exec chmod 755 '{}' +
}
