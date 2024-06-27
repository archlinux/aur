# Maintainer: Nriver <6752679+Nriver@users.noreply.github.com>
pkgname="zed-cn-bin"
pkgver=0.141.2_20240627
pkgrel=2
pkgdesc="Zed editor Chinese version"
arch=('x86_64')
url="https://github.com/Nriver/zed-translation"
license=('AGPL3')
source=("zed.zip::https://github.com/Nriver/zed-translation/releases/download/v$pkgver/zed.zip")
sha256sums=('e69af613fc2d9c4bb90b05c9943cde089373f8113c46350e0281505c2a6fb780')

build() {
  cd "$srcdir"
}

package() {
    export destdir="$pkgdir/"
    # Make folders for extraction
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/share/applications"
    mkdir -p "$pkgdir/usr/share/icons"
    # Move main files

    echo $PWD
    # Create command
    install -vDm755 zed $pkgdir/usr/bin/zed-cn
    # Create .desktop file
    install -vDm755 ../zed-cn.desktop "$pkgdir/usr/share/applications/zed-cn.desktop"
    # Create icon
    install -vDm755 ../zed-cn.png "$pkgdir/usr/share/icons/zed-cn.png"
}
