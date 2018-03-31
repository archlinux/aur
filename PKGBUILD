# Maintainer: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>

pkgname=trizen
pkgver=1.45
pkgrel=1
epoch=1
pkgdesc="Trizen AUR Package Manager: A lightweight wrapper for AUR."
arch=('any')
url="https://github.com/trizen/${pkgname}"
license=('GPL3')

depends=(
         'git'
         'pacutils'
         'perl>=5.20.0'
         'perl-libwww'
         'perl-term-ui'
         'pacman'
         'perl-json'
         'perl-data-dump'
         'perl-lwp-protocol-https'
         'perl-term-readline-gnu'
        )

optdepends=(
            'perl-json-xs: faster JSON deserialization'
            #'perl-term-readline-gnu: better STDIN support'
           )

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/trizen/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('768fd6a3b35bc2787e3a0d1b9372020b52da4f5c4edc09eb81a52c2a4a89d85d')

package() {
  cd "$pkgname-$pkgver"
  install -m 755 -D $pkgname "$pkgdir/usr/bin/$pkgname"
  install -m 644 -D "zsh.completion" "$pkgdir/usr/share/zsh/site-functions/_trizen"
  install -m 644 -D "bash.completion" "$pkgdir/usr/share/bash-completion/completions/trizen"
}
