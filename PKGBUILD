
pkgname=nijigenerate-bin
pkgver=v0.9.2
pkgrel=1
pkgdesc="Open source editor for rigging nijilive puppets (fork of Inochi2D)."
arch=('x86_64')
url="https://github.com/nijigenerate/nijigenerate"
license=('BSD 2-Clause')
provides=(nijigenerate)
depends=(unzip)
conflicts=()
options=()
source=("nijigenerate-linux-x86_64-$pkgver.zip::https://github.com/nijigenerate/nijigenerate/releases/download/$pkgver/nijigenerate-linux-x86_64.zip"
        "nijigenerate.xml"
        "nijigenerate.desktop")
sha256sums=('7ed8b8fd7c8e6e12de9d8fb0d0e39d7f47819a8b89b714a98376dabcd6dba8a9'
            '0a32f612b0719042b8319d91d57c01b5fac0837143f4b2734c6f48fb5659790e'
            'feaeed6e98a1905b42e0133d54e2411f9e12720d281970e09e9aab46919fe592')

package() {

    install -Dm644 "nijigenerate.xml" "$pkgdir/usr/share/mime/packages/nijigenerate.xml"
    install -Dm644 "nijigenerate.desktop" "$pkgdir/usr/share/applications/nijigenerate.desktop"

    mkdir -p "$pkgdir/usr/lib/nijigenerate"
    unzip "nijigenerate-linux-x86_64-$pkgver.zip" -d "$pkgdir/usr/lib/nijigenerate/"

    mkdir -p "$pkgdir/usr/bin"
    ln -s /usr/lib/nijigenerate/nijigenerate "$pkgdir/usr/bin/nijigenerate"
}

