# Maintainer: Art Dev <artdevjs at gmail dot com>
pkgname=lsd-bin
_pkgname="lsd"
pkgver=0.20.1
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

  install -Dm644 ${srcdir}/${_pkgname}-${pkgver}-${CARCH}-unknown-linux-musl/${_pkgname}.1 "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
  install -Dm644 ${srcdir}/${_pkgname}-${pkgver}-${CARCH}-unknown-linux-musl/autocomplete/${_pkgname}.bash-completion "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -Dm644 ${srcdir}/${_pkgname}-${pkgver}-${CARCH}-unknown-linux-musl/autocomplete/_${_pkgname} "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
}

sha256sums=('8ac55367fe25f54dde9d37111abac4c98ef7668b56a36e6c464d5d52ea22c346')
