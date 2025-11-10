# Maintainer: Inc44
pkgname=dietpdf-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Reduce PDF file size"
arch=('x86_64')
url="https://github.com/Zigazou/dietpdf-haskell"
license=('BSD-3-Clause')
depends=('libjpeg-turbo' 'imagemagick')
optdepends=('ghostscript' 'grok-jpeg2000' 'ttfautohint')
provides=('dietpdf')
conflicts=('dietpdf')
_debname="dietpdf_${pkgver}_amd64.deb"
source=("$url/releases/download/v$pkgver/$_debname")
sha256sums=('c5c766ef0d12f37d982f31766b947652429814ab4d38f5dd2f1e31e70aa367eb')

package() {
  ar x "$srcdir/$_debname"
  tar -xf "$srcdir/data.tar.gz" -C "$pkgdir/" --no-same-owner
}
