# Maintainer: herzrasen <dennis@herzrasen.me>
pkgname=pkghist-bin
pkgver=0.6.1
pkgrel=1
pkgdesc="Query your pacman logs. Precompiled binary."
arch=('x86_64')
url="https://github.com/herzrasen/pkghist"
license=('MIT')
depends=('git')

provides=('pkghist')
conflicts=('pkghist')

source=("${pkgname/-bin/}-${pkgver}.tar.gz::https://github.com/herzrasen/${pkgname/-bin/}/releases/download/v${pkgver}/${pkgname/-bin/}.tar.gz")
sha1sums=('8753dcc85c2dd549ae1e3186d407f948a6590eba')

package() {
  _pkg="${pkgname/-bin/}" 
  install -Dm755 ${_pkg} "${pkgdir}/usr/bin/${_pkg}"
  install -Dm644 completions/_${_pkg} "${pkgdir}/usr/share/zsh/site-functions/_${_pkg}"
  install -Dm644 completions/${_pkg}.bash "${pkgdir}/usr/share/bash-completion/completions/${_pkg}"
  install -Dm644 completions/${_pkg}.fish "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkg}.fish"
}

