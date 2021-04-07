# Maintainer: The-Repo-Club <The-Repo-Club@github.com>
# Contributor: The-Repo-Club <The-Repo-Club@github.com>

pkgname=cutycapt
pkgver=2021.04.04
pkgrel=1
pkgdesc="A Qt and WebKit based command-line utility that captures WebKit's rendering of a web page."
arch=('any')
groups=('therepoclub')
url="https://github.com/The-Repo-Club/$pkgname"
license=('CC BY-NC-SA 4.0')
depends=('qt5-base' 'qt5-svg' 'qt5-webkit')
makedepends=('make')
provides=('cutycapt')
source=("${pkgname}-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz")
sha256sums=('c9a08c5a7b4bb3e9dba39e0eeb1d7611447c62346b4a3d66796988e4144fa894')

build() {
    cd "$pkgname-$pkgver/src"
    qmake-qt5 CutyCapt.pro
    make
}

package() {
  cd "$pkgname-$pkgver/src"
  install -Dm755 CutyCapt "${pkgdir}/usr/bin/cutycapt"
  install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
