# Maintainer: Keiran <keiran0@proton.me>
# Made possible by: Gurov <https://github.com/Gur0v>
pkgname=archium
pkgver=1.9.1
pkgrel=1
pkgdesc="Fast & Easy Package Management for Arch Linux"
arch=('x86_64')
url="https://github.com/keircn/archium"
license=('GPL')
depends=('git' 'readline')
makedepends=('gcc' 'make')
source=("git+https://github.com/keircn/archium.git#tag=v${pkgver}")
sha256sums=('a7ee9ab64b9c8f8a0a6b15fd9ff568e657d2210e17f17da0e801a338fb7510ff')

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  
  install -Dm755 "build/archium" "${pkgdir}/usr/bin/${pkgname}"
  
  install -Dm644 "completions/archium.bash" "${pkgdir}/usr/share/bash-completion/completions/archium"
  install -Dm644 "completions/archium.zsh" "${pkgdir}/usr/share/zsh/site-functions/_archium"
  install -Dm644 "completions/archium.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/archium.fish"
}
