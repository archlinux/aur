# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=verco-bin
pkgver=6.3.1
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
sha512sums_x86_64=('86cac6ceb74cb1188224e93cdbac0438517d99107beda14633b189b5f62761961a0214f9d68c0f351a6ee8f924dc80da8a248924750db10a1c8ff0714613ee04'
                   '80870996c1cb69d8d80778126d32f1a9f4ac2a3ca1e9dc92f0d55234f29e1774d4be655603c4371765e9ddc80d5f4a156b2ab153cded5bda2ef9f66b429f8c0f')

package() {
  install -Dm 755 "$pkgname-$pkgver" "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
