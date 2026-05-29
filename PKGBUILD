# Maintainer: Dominic Brekau <aur@dominic.brekau.de>

pkgname=pv-migrate-bin
_pkgname=pv-migrate
pkgver=3.4.0
pkgrel=1
pkgdesc='CLI tool to easily migrate Kubernetes persistent volumes'
arch=('x86_64')
url='https://github.com/utkuozdemir/pv-migrate'
provides=('pv-migrate')
license=('Apache')
source=("https://github.com/utkuozdemir/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_linux_x86_64.tar.gz")
sha256sums=('f3ff8a21f70b14a497b52762b454755dc94df5d1c2596e14e7de365d4d8d5ba1')

package() {
  install -Dm 755 "$srcdir/${_pkgname}" -t "$pkgdir/usr/bin"
  install -Dm 644 "$srcdir/completions/${_pkgname}.bash" "$pkgdir/usr/share/bash-completion/completions/${_pkgname}"
  install -Dm 644 "$srcdir/completions/${_pkgname}.zsh" "$pkgdir/usr/share/zsh/site-functions/_${_pkgname}"
  install -Dm 644 "$srcdir/completions/${_pkgname}.fish" "$pkgdir/usr/share/fish/vendor_completions.d/${_pkgname}"
}

