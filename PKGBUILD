# Maintainer: Edmund Lodewijks <edmund at proteamail.com>

pkgname=route-summarization
pkgver=0.3.1
pkgrel=1
pkgdesc="Summarize CIDR classes with Perl"
arch=(any)
url="https://github.com/edmundlod/route-summarization"
license=('BSD-3-Clause')
depends=('glibc' 'perl' 'perl-net-cidr-lite')
makedepends=('git')
source=("${pkgname}"::"git+https://github.com/edmundlod/"${pkgname}".git#tag=v${pkgver}")
b2sums=('1b9bb08ba0fbfeb820a32a5a7b06924205c2a216f7ad8488bd548700342ff9a43fa2b6aabcbfab93cbe24ddeb8171920e62f6884a445fc6887c1858858fd9a34')

package() {
  cd "$pkgname"
  
  install -Dm754 aggregateCIDR.pl -t "$pkgdir"/usr/bin

  install -Dm644 README.md -t "$pkgdir"/usr/share/doc/$pkgname

  # license
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
