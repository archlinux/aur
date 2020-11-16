# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=gping-bin
pkgver=0.1.7
pkgrel=1
pkgdesc="Ping, but with a graph"
arch=('x86_64')
url="https://github.com/orf/gping"
license=('MIT')
depends=('iputils')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-git")
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}-Linux-x86_64.tar.gz"
               "$pkgname-$pkgver-LICENSE::$url/raw/v$pkgver/LICENSE"
               "$pkgname-$pkgver-readme.md::$url/raw/v$pkgver/readme.md")
sha512sums_x86_64=('4abe3852b096b254848949482d0b9637fd8ba666aaaf5d67c966ba2bb2626c8cde70b480bd6c79fd7ab629012723638b8686c08439ac9e6da96b5134231a0c73'
                   '372499ab23419bfb2f1644f523d8ba1ce9c280e87795db6bf62673e7891394c51846e3f427c52e0603837b82dbc9399d0f4a25fac016a812e09fc54cf6c3a88d'
                   '80ca73521502d20e3c4fa4f41895da180cc113b775b21287eb8cd9decedd1fa29235ce8c3b77d1b84a34b1da01b2b4aacaaf4a3b80d9eb950f006fbe69187d48')

package() {
  install -Dm 755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -Dm 644 "$pkgname-$pkgver-readme.md" "$pkgdir/usr/share/doc/${pkgname%-bin}/readme.md"
  install -Dm 644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
