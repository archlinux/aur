# Maintainer: yantene <contact at yantene dot net>
pkgname=ttf-mizutama-emoji
pkgver=0.9
pkgrel=2
pkgdesc="A dot-patterned emoji font based on Twemoji"
arch=('any')
url="https://github.com/yantene/mizutama-emoji-font"
license=('custom:CCPL:by-4.0' 'MIT')

# ttf-bitstream-vera is default font for bug-free font fallback with the provided fontconfig.
# See: https://github.com/eosrei/emojione-color-font#why-bitstream-vera
depends=(fontconfig xorg-font-utils)
optdepends=('ttf-bitstream-vera: default fallback font used for configuration')

_pkgver=${pkgver//_/-}
_archive=MizutamaEmoji-${_pkgver}

install=ttf-mizutama-emoji.install

source=(
  "${url}/releases/download/v${_pkgver}/${_archive}.tar.gz"
)

package() {
  cd ${_archive}
  install -Dm644 MizutamaEmoji.ttf -t "$pkgdir"/usr/share/fonts/TTF/
  install -Dm644 LICENSE* -t "$pkgdir"/usr/share/licenses/$pkgname/
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README
}

md5sums=('fba24b3aabe57447a902bd41eff4b9fc')
