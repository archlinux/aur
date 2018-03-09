# Maintainer: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>

pkgname=trizen
pkgver=1.44
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
sha256sums=('1f53a144ffd050f4e7d59e6d0ffd2f80ac6927b673982b432cc3ddfd9a43d19e')

package() {
  cd "$pkgname-$pkgver"
  install -m 755 -D $pkgname "$pkgdir/usr/bin/$pkgname"
  install -m 644 -D "zsh.completion" "$pkgdir/usr/share/zsh/site-functions/_trizen"
  install -m 644 -D "bash.completion" "$pkgdir/usr/share/bash-completion/completions/trizen"
}
