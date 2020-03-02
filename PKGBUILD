# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=nushell-stable
pkgver=0.10.0
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
sha256sums=('8e08dd1a9d25a67ffcfb32a9c6de8bfde5f797b74c44935e553db65fcd848497')

package() {
  cd "nushell-${pkgver}"

  cargo install \
    --locked \
    --path . \
    --features stable \
    --root "${pkgdir}"/usr

  rm -f "${pkgdir}"/usr/.crate*
}
