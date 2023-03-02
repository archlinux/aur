# Maintainer: Alessandro Zanatta <alessandro.zanatta.lav@gmail.com>
pkgname=into-cps-application-bin
_pkgname=INTO-CPS-application
pkgver=4.0.5
pkgrel=1
pkgdesc="Frontend of the INTO-CPS Tool Chain"
arch=('x86_64')
url="https://github.com/INTO-CPS-Association/into-cps-application"
license=('MIT')
provides=('into-cps-application')
source=("https://github.com/INTO-CPS-Association/$_pkgname/releases/download/v$pkgver/$_pkgname-$pkgver.AppImage")
sha256sums=('6d7650d4c85289ddb0509271ef5185a046beb1c4a485d778cfa9cee45d7d6f40')
optdepends=()

package() {
    install -Dm755 "$srcdir/$_pkgname-$pkgver.AppImage" "$pkgdir/opt/$_pkgname/$_pkgname.AppImage"
    
    # Symlink AppImage
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/$_pkgname/$_pkgname.AppImage" "$pkgdir/usr/bin/$_pkgname"
}

