# Maintainer: Javier Orfo <javierorfo@protonmail.com>

pkgname=ztatusbar
pkgver=0.1.1
pkgrel=1
pkgdesc="Configurable statusbar for Xorg server using xsetroot. Made in Zig with toml file configuation."
arch=('x86_64')
url="https://github.com/javiorfo/ztatusbar"
license=('MIT')
depends=('curl' 'xorg-xsetroot')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/ztatusbar-$pkgver.tar.gz")
sha512sums=('11deeb0f65d449bf0bf1da8cb56bfc50570ab1d6d900e359d1c47c73023882d8c1e847708782c4362f41009f91a06e0c1df4e16a33d82ad9407648fbd38a7525')
conflicts=("${pkgname}")
provides=("${pkgname}")

package() {
  cd "${pkgname}-$pkgver"
  install -Dm 755 "${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm 644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
}
