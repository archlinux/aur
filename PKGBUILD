# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=gping-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Ping, but with a graph"
arch=('x86_64')
url="https://github.com/orf/gping"
license=('MIT')
depends=('iputils')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}-Linux-x86_64.tar.gz"
               "$pkgname-$pkgver-LICENSE::$url/raw/v$pkgver/LICENSE"
               "$pkgname-$pkgver-readme.md::$url/raw/v$pkgver/readme.md")
sha512sums_x86_64=('2ceab63ad29e27056eebf9a8db53a01c28a505740827745171c46388c35ea1e060361a47c743ed3310508e1a11aa0c6b1fceb3d2373522c25519376116fd0f5e'
                   '372499ab23419bfb2f1644f523d8ba1ce9c280e87795db6bf62673e7891394c51846e3f427c52e0603837b82dbc9399d0f4a25fac016a812e09fc54cf6c3a88d'
                   '42be4515d1f0cb0eabc71cf5e95114145c28ba2ac57d26b8b6a7460c1b502f69f8f1f8140446137af7c19efb0498cd0b510d257935d2d3f37fd6020141f474ee')

package() {
  install -Dm 755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -Dm 644 "$pkgname-$pkgver-readme.md" "$pkgdir/usr/share/doc/$pkgname/readme.md"
  install -Dm 644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
