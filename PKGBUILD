# Maintainer: pinkdad <pinkdad@proton.me>
pkgname=grooveauthor-bin
pkgver=1.1.2
pkgrel=3
pkgdesc="A free open-source editor for authoring StepMania charts"
arch=('x86_64')
url="https://github.com/PerryAsleep/GrooveAuthor"
license=('MIT')
depends=('dotnet-runtime-8.0' 'fontconfig' 'gcc-libs' 'glibc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/PerryAsleep/GrooveAuthor/releases/latest/download/GrooveAuthor-v$pkgver-linux-x64.tar.gz"
        "LICENSE::https://raw.githubusercontent.com/PerryAsleep/GrooveAuthor/refs/tags/v$pkgver/LICENSE")
sha256sums=('c402319025928aad0cb9c7934720ed6b2e528cf77c12a7ec676e5723294eeca0'
            'aaf15363b40ddcddc5a479a3dfcea7f04df7f919baf11d4ea5645b9a50987c4c')

prepare() {
  tar -xf "$srcdir/$pkgname-$pkgver.tar.gz" -C "$srcdir"
}

package() {
  install -d "$pkgdir/opt/grooveauthor"
  cp -r --preserve=mode,timestamps "$srcdir/grooveauthor" "$pkgdir/opt"

  install -Dm644 "$srcdir/grooveauthor/GrooveAuthor.desktop" \
    "$pkgdir/usr/share/applications/GrooveAuthor.desktop"

  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/grooveauthor/LICENSE"
}
