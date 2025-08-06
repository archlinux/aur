# Maintainer: leux08 <contato@leux08.dev.br>
pkgname=pixieditor-bin
_pkgname=pixieditor
pkgver=2.0.1.7
pkgrel=1
pkgdesc="Universal 2D Graphics Editor"
arch=('x86_64')
url="https://pixieditor.net"
license=('LGPL-3.0')
depends=()
source=("https://github.com/PixiEditor/PixiEditor/releases/download/$pkgver/PixiEditor-$pkgver-amd64-linux.tar.gz")
md5sums=('77c3debff9aa6ddbec5c8e0ec0e454e2')

package() {
    mkdir -p "$pkgdir"/usr/bin
    mkdir -p "$pkgdir"/usr/share/applications
    mkdir -p "$pkgdir"/usr/share/pixmaps
    mkdir -p "$pkgdir"/opt

    cp -r . "$pkgdir"/opt/$pkgname

    install -m755 ../$_pkgname.sh "$pkgdir"/usr/bin/$_pkgname

    install -m644 ../*.desktop "$pkgdir"/usr/share/applications/

    install -m644 ./Assets/PixiEditorLogo.png "$pkgdir"/usr/share/pixmaps/pixieditor.png
}
