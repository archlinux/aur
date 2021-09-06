# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=verco-bin
pkgver=6.1.2
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
sha512sums_x86_64=('a80bfca03bf6aa1fd3f131041394eb984dbd5c8dd586f331bcd40f27ca567c8c7e7e1b2565f1803065c1e19b8410ffe188ed8b5c3c93f0962a9f19a5ab736e55'
                   'aeacb1c475e8284c4838a4fd38cb4ee76e3a6626a9f54b1e64a8e220e0b314c146b8c4664bde0c0f06105086dc3e6e10e8c7e642bfe80f2ee0d719428cd3bb75')

package() {
  install -Dm 755 "$pkgname-$pkgver" "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
