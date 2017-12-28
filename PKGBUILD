# Maintainer: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>

pkgname=trizen
pkgver=1.36
pkgrel=1
epoch=1
pkgdesc="Trizen AUR Package Manager: A lightweight wrapper for AUR."
arch=('any')
url="https://github.com/trizen/${pkgname}"
license=('GPL3')

depends=(
         'git'
         'diffutils'
         'pacutils'
         'perl>=5.20.0'
         'perl-libwww'
         'perl-term-ui'
         'pacman'
         'perl-json'
         'perl-data-dump'
         'perl-lwp-protocol-https'
        )

optdepends=(
            'perl-json-xs: faster JSON deserialization'
            'perl-term-readline-gnu: better STDIN support'
           )

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/trizen/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('54a3330e75a0b516319be9aa81c5b58faf22ba0f955e125f7b71a572e8f3041f')

package() {
  cd "$pkgname-$pkgver"
  install -m 755 -D $pkgname "$pkgdir/usr/bin/$pkgname"
  install -m 644 -D "zsh.completion" "$pkgdir/usr/share/zsh/site-functions/_trizen"
}
