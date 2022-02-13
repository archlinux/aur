# Maintainer: MedzikUser <nivua1fn@duck.com>
_repo='MedzikUser/discordrpc'
_ver=v0.1.0

_pkgname='discordrpc'
pkgname="${_pkgname}"
pkgver=0.1.0
pkgrel=1
pkgdesc='Fast Discord RPC Client written in Rust'
arch=('x86_64')
url="https://github.com/${_repo}"
license=('BSD3')

makedepends=('cargo')

source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${_ver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${_pkgname}-${pkgver}"

  cargo build --release
}

package() {
  cd "${_pkgname}-${pkgver}"

  install -Dm 755 target/release/${_pkgname} "${pkgdir}/usr/bin/${pkgname}"

  #mkdir -p "$pkgdir"/usr/share/{bash-completion/completions,zsh/site-functions,fish/vendor_completions.d}
  #target/release/${_pkgname} completions bash > "$pkgdir"/usr/share/bash-completion/completions/${pkgname}
  #target/release/${_pkgname} completions zsh > "$pkgdir"/usr/share/zsh/site-functions/_${pkgname}
  #target/release/${_pkgname} completions fish > "$pkgdir"/usr/share/fish/vendor_completions.d/${pkgname}.fish

  install -Dm 644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
