# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=dotter-rs-bin
_pkgname=dotter
pkgver=0.9.2
pkgrel=1
pkgdesc="A dotfile manager and templater written in Rust"
arch=('x86_64')
url="https://github.com/SuperCuber/dotter"
license=('Unlicense')
conflicts=("$_pkgname" "${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/$_pkgname"
               "$pkgname-$pkgver-README.md::$url/raw/v$pkgver/README.md")
sha512sums_x86_64=('986df03c98b8c3d4a48a43a283272530d7f98859e76cd97c633de163e0c276554b86a30ac1834c9eef2cf094ae6c7009b0ae5597c1d200e810a6b0c0342076de'
                   'ee2e4d92e68993ead92cb965f0f9d22e47b3cc4c17926e1aa74f829a82cee536491fb211809d046d6651e87275471e151da41dd3f43bb9a613f5b8372ec00361')

package() {
  install -Dm 755 "$pkgname-$pkgver" "${pkgdir}/usr/bin/$_pkgname"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
}
