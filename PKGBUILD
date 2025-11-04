# Maintainer: Keiran <keiran0@proton.me>
# Made possible by: Gurov <https://github.com/Gur0v>
pkgname=archium
pkgver=1.10.0
pkgrel=1
pkgdesc="Fast & Easy Package Management for Arch Linux"
arch=('x86_64')
url="https://github.com/keircn/archium"
license=('GPL')
depends=('git' 'readline')
makedepends=('gcc' 'make')
source=("git+https://github.com/keircn/archium.git#tag=v${pkgver}")
sha256sums=('d71c05b76b5edca13b59096243fd01b16b03dd117b3cc646ac6621e0ab1a9300')

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
