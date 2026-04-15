# Maintainer: LeBlusz <pyrowski5@wp.pl>
pkgname=grooveauthor-bin
pkgver=1.1.4
pkgrel=1
pkgdesc="A free open-source editor for authoring StepMania charts"
arch=('x86_64')
url="https://github.com/PerryAsleep/GrooveAuthor"
license=('MIT')
depends=('dotnet-runtime-10.0' 'fontconfig' 'gcc-libs' 'glibc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/PerryAsleep/GrooveAuthor/releases/latest/download/GrooveAuthor-v$pkgver-linux-x64.tar.gz"
        "GA-LICENSE::https://raw.githubusercontent.com/PerryAsleep/GrooveAuthor/refs/tags/v$pkgver/LICENSE")
sha256sums=('b0129033a4c7d8235a1e35b504b7d3e40060a1b51074c4f7949634492cdcdd1d'
            '3b31d89c6433541f91e7c6b4707b449fa412cdeed74e1b44f7ba47160565c650')

prepare() {
  tar -xf "$srcdir/$pkgname-$pkgver.tar.gz" -C "$srcdir"
}

package() {
  install -d "$pkgdir/opt/grooveauthor"
  cp -r --preserve=mode,timestamps "$srcdir/grooveauthor" "$pkgdir/opt"

  install -Dm644 "$srcdir/grooveauthor/GrooveAuthor.desktop" \
    "$pkgdir/usr/share/applications/GrooveAuthor.desktop"

  install -Dm644 "$srcdir/GA-LICENSE" "$pkgdir/usr/share/licenses/grooveauthor/LICENSE"
}
