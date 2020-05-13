# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=nushell-stable
pkgver=0.14.0
pkgrel=1
pkgdesc='A new type of shell.'
url='https://www.nushell.sh'
license=('MIT')
makedepends=('rust')
depends=('openssl')
optdepends=('libxcb' 'libx11')
arch=('x86_64')
install='nushell-stable.install'
source=("https://github.com/nushell/nushell/archive/${pkgver}.tar.gz")
sha256sums=('8084bb21433aa3598475470abf78e6653440b51db2f28392212eee00238c3346')

package() {
  cd "nushell-${pkgver}"

  cargo install \
    --locked \
    --path . \
    --features stable \
    --root "${pkgdir}"/usr

  rm -f "${pkgdir}"/usr/.crate*
}
