# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>
# Contributor: alienzj <alienchuj@gmail.com>

pkgname=seqtk
pkgver=1.5
pkgrel=1
pkgdesc="Toolkit for processing sequences in FASTA/Q formats"
arch=('x86_64')
url="https://github.com/lh3/seqtk"
license=('MIT')
depends=('zlib')
provides=('seqtk')
conflicts=('seqtk')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('384aa1e3cecf4f70403839d586cbb29d469b7c6f773a64bc5af48a6e4b8220a6')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 seqtk "$pkgdir/usr/bin/seqtk"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
