# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Bumsik Kim <k.bumsik@gmail.com>
# Contributor: KokaKiwi <kokakiwi+aur@kokakiwi.net>
# Scripts inspired by nushell-git package

_pkgname=nu
pkgname=${_pkgname}shell
pkgver=0.18.1
pkgrel=1
pkgdesc="A new type of shell."
url="https://www.nushell.sh"
license=('MIT')
makedepends=('rust')
depends=('openssl')
optdepends=('libxcb' 'libx11')
arch=('x86_64' 'i686')
source=("https://github.com/nushell/nushell/archive/$pkgver.tar.gz")
# Use updpkgsums to update the checksum
sha256sums=('68761a9145630199df16ccb39225acd58c19c8773aaa79ab5eb1674ff694ca79')

package() {
  install=nushell.install

  cd "$srcdir/$pkgname-$pkgver"

  cargo install \
    --locked \
    --path . \
    --features stable \
    --root "${pkgdir}"/usr

  rm -f "${pkgdir}"/usr/.crate*
}
