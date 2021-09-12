# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=verco-bin
pkgver=6.4.0
pkgrel=1
pkgdesc="A simple Git/Mercurial/PlasticSCM tui client based on keyboard shortcuts"
arch=('x86_64')
url="https://github.com/vamolessa/verco"
license=('GPL3')
depends=('gcc-libs')
optdepends=('git: support for git repositories'
            'mercurial: support for mercurial repositories')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/${pkgname%-bin}-linux-x86_64"
               "$pkgname-$pkgver-README.md::$url/raw/v$pkgver/README.md")
sha512sums_x86_64=('8692f12ee8f3e506233d2a4bc0324978a2dfe30d2e27db2d663c63e211c525bbdf71a11e68fbc9f519e8b090142708497acc1639609a2984c4fae2692fc68960'
                   '19db9a2ef568f65060ca38e0f41feed0f1fe518312276d560113842c017e1f52172018631f50c6b85df8dacd8413f9c85b6e1651d39e6b89c9d8cfbd231f021b')

package() {
  install -Dm 755 "$pkgname-$pkgver" "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
