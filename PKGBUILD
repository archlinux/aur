pkgname=dosierskanilo
pkgver=26.9.2
pkgrel=1
pkgdesc='Blob-centric media and archive file scanner'
arch=('x86_64')
url='https://github.com/cschlote/DosierSkanilo'
license=('custom:CC-BY-NC-SA-4.0')
depends=('mediainfo' 'file' 'unzip' 'tar' 'unrar' 'p7zip')
makedepends=('ldc' 'dub' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/DosierSkanilo-$pkgver"
  DC=ldc2 dub build --build=release --compiler=ldc2 --config=cli
}

package() {
  cd "$srcdir/DosierSkanilo-$pkgver"
  install -Dm755 build/bin/dosierskanilo "$pkgdir/usr/bin/dosierskanilo"
}
