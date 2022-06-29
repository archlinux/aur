# Maintainer: Dominic Brekau <aur@dominic.brekau.de>

pkgname=pv-migrate-bin
_pkgname=pv-migrate
pkgver=1.0.0
pkgrel=1
pkgdesc='CLI tool to easily migrate Kubernetes persistent volumes'
arch=('x86_64')
url='https://github.com/utkuozdemir/pv-migrate'
provides=('pv-migrate')
license=('Apache')
source=("https://github.com/utkuozdemir/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_linux_x86_64.tar.gz")
sha256sums=('cabb29a7c72854888467e60f4e8abe92c0bea65f5a6a20f458d4e01cec39b561')

package() {
  install -Dm 755 "$srcdir/${_pkgname}" -t "$pkgdir/usr/bin"
  install -Dm 644 "$srcdir/completions/${_pkgname}.bash" "$pkgdir/usr/share/bash-completion/completions/${_pkgname}"
  install -Dm 644 "$srcdir/completions/${_pkgname}.zsh" "$pkgdir/usr/share/zsh/site-functions/_${_pkgname}"
  install -Dm 644 "$srcdir/completions/${_pkgname}.fish" "$pkgdir/usr/share/fish/vendor_completions.d/${_pkgname}"
}

