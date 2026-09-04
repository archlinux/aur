# Maintainer: Dominic Brekau <aur@dominic.brekau.de>

pkgname=pv-migrate-bin
_pkgname=pv-migrate
pkgver=3.6.2
pkgrel=1
pkgdesc='CLI tool to easily migrate Kubernetes persistent volumes'
arch=('x86_64')
url='https://github.com/utkuozdemir/pv-migrate'
provides=('pv-migrate')
license=('Apache')
source=("https://github.com/utkuozdemir/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_linux_x86_64.tar.gz")
sha256sums=('edc5f1d4c28d8bde62ba61d4d92485e835f01333688af1fb8c0705cbe9b96367')

package() {
  install -Dm 755 "$srcdir/${_pkgname}" -t "$pkgdir/usr/bin"
  install -Dm 644 "$srcdir/completions/${_pkgname}.bash" "$pkgdir/usr/share/bash-completion/completions/${_pkgname}"
  install -Dm 644 "$srcdir/completions/${_pkgname}.zsh" "$pkgdir/usr/share/zsh/site-functions/_${_pkgname}"
  install -Dm 644 "$srcdir/completions/${_pkgname}.fish" "$pkgdir/usr/share/fish/vendor_completions.d/${_pkgname}"
}

