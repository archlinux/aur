# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=verco-bin
pkgver=6.12.0
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
sha512sums_x86_64=('4c935e97091ecff57acb93b38bafa5bad8fa58e14c6595b539ee51517cc78774d4dc5c3de724179a313d649907d86a15000e5579f2d59422d1458c24d9bcb5cb'
                   '1bcc1c1e0ea31986d4bf74ff31626b70d64864a559d46619481469dc771643936fc4d9fc16fab279ea396f010e32ff3b1c46cdf3cf1028d5e7c0c67c78effad1')

package() {
  install -Dm 755 "$pkgname-$pkgver" "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
