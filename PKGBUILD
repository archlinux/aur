# Maintainer: Art Dev <artdevjs at gmail dot com>
pkgname=lsd-bin
_pkgname="lsd"
pkgver=0.19.0
pkgrel=1
pkgdesc="The next gen ls command"
arch=("x86_64")
url="https://github.com/Peltoche/lsd"
license=("Apache")
provides=("lsd")
conflicts=("lsd" "lsd-git")
source=(
  "lsd.tar.gz::https://github.com/Peltoche/lsd/releases/download/${pkgver}/${_pkgname}-${pkgver}-${CARCH}-unknown-linux-musl.tar.gz"
)

package(){
  install -Dm755 ${srcdir}/${_pkgname}-${pkgver}-${CARCH}-unknown-linux-musl/${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 ${srcdir}/${_pkgname}-${pkgver}-${CARCH}-unknown-linux-musl/autocomplete/${_pkgname}.bash-completion "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -Dm644 ${srcdir}/${_pkgname}-${pkgver}-${CARCH}-unknown-linux-musl/autocomplete/_${_pkgname} "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
}

sha256sums=('3b04e109956aa98893473b194ae6235cdeeabf45f3ba9e0dda3feb48717e308b')
