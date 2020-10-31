# Maintainer: Nagy Roland <roliboy@protonmail.com>

pkgname=neovim-dracula
pkgver=2.0.0
pkgrel=1
pkgdesc="Dracula theme for neovim"
arch=('any')
url="https://github.com/dracula/vim"
license=('MIT')
depends=('neovim')
groups=('neovim-plugins')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dracula/vim/archive/v${pkgver}.tar.gz")
sha256sums=('b783e2879c13dcdcd8a1a24b8ebe37a8b4482eb26e0b516e559d1d5f7182ed01')

prepare() {
    cd "vim-${pkgver}"
    chmod 755 after/ autoload/ colors/ doc/
}

package() {
  cd "vim-${pkgver}"
  local _installpath="${pkgdir}/usr/share/nvim/runtime"

  install -d "${_installpath}"

  cp -r after ${_installpath}
  cp -r autoload ${_installpath}
  cp -r colors ${_installpath}
  cp -r doc ${_installpath}

  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
