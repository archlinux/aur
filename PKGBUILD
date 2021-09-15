# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=verco-bin
pkgver=6.5.4
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
sha512sums_x86_64=('b4439beb142f0e08a407133f7621e09ab263fc7d6c58c2e252d474f923a84b32c867ade7a485d98db5d72bf0dc1da12fd10cbdeb8808ec680cd9b3964184cb58'
                   '4cfc35ac4effeb37d8ce98721053f45fde89b75f5a561be2ac9bca08ebfef60173ce62f9668fd2032c1e8ac718cd36bc855ba38a17bd4b966989f283867b6801')

package() {
  install -Dm 755 "$pkgname-$pkgver" "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
