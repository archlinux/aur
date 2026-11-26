
pkgname=nijigenerate-bin
pkgver=v1.0.0beta4
_githubrel=v1.0.0-beta4
pkgrel=1
pkgdesc="Open source editor for rigging nijilive puppets (fork of Inochi2D)."
arch=('x86_64')
url="https://github.com/nijigenerate/nijigenerate"
license=('BSD 2-Clause')
provides=(nijigenerate)
makedepends=(unzip)
depends=(dbus sdl2-compat openssl-3 libpng zlib zstd bzip2 brotli freetype2 systemd-libs gcc-libs)
conflicts=()
options=()
source=("nijigenerate-linux-x86_64-$pkgver.zip::https://github.com/nijigenerate/nijigenerate/releases/download/$_githubrel/nijigenerate-linux-x86_64.zip"
        "nijigenerate.xml"
        "nijigenerate.desktop")
sha256sums=('0616c430230740bfd2a4e182c3ab4878358ccfd1a30380e70d349c4d7bafc7bf'
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

