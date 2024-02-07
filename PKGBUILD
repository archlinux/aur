# Maintainer: pitbuster <felipe.contreras.s@gmail.com>
pkgname=minify-html-bin
pkgver=0.15.0
pkgrel=1
pkgdesc='A Rust HTML minifier meticulously optimised for speed and effectiveness'
url='https://github.com/wilsonzlin/minify-html'
source=('LICENSE')
source_x86_64=("https://github.com/wilsonzlin/minify-html/releases/download/v$pkgver/minhtml-$pkgver-x86_64-unknown-linux-gnu")
source_aarch64=("https://github.com/wilsonzlin/minify-html/releases/download/v$pkgver/minhtml-$pkgver-aarch64-unknown-linux-gnu")
arch=('x86_64' 'aarch64')
license=('MIT')
depends=('gcc-libs')
sha256sums=('a131d5418ac118f39e3b4478b30e3b1769c407fa389850abc422fc64c1675310')
sha256sums_x86_64=('e848a60abfd92441fd8eca99281074c166f6a7ce8e05eea3d8033c49ea66524d')
sha256sums_aarch64=('e411087fc2ea978223e61bab58c20304e92ea81b09c79e36d1481885bea525be')

package() {
  cd "$srcdir/"

  install -Dm755 minhtml-${pkgver}-${CARCH}-unknown-linux-gnu "${pkgdir}/usr/bin/minify-html"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
