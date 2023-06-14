# Maintainer: Tomas S. <me+aur at wereii.cz>

pkgname=pyfa-appimage
pkgver=2.53.0
pkgrel=1
_distname="Pyfa-${pkgver}"
pkgdesc="EVE Online Fitting Assistant"
arch=('any')
url="https://github.com/pyfa-org/Pyfa"
license=('GPL3')
conflicts=('pyfa')
depends=('fuse2')
options=(!strip)
source=(${_distname}.AppImage::https://github.com/pyfa-org/Pyfa/releases/download/v$pkgver/pyfa-v$pkgver+3-g194e4657e-linux.AppImage
        pyfa.desktop)

sha256sums=('2e64861719edd92651375889e00bd92689d586ed8bfc9c2752c6cb57197cec2c'
            SKIP)

package() {
    install -Dm755 "$srcdir/${_distname}.AppImage" "$pkgdir/opt/pyfa/${_distname}.AppImage"
    install -Dm644 "$srcdir/pyfa.desktop" "$pkgdir/usr/share/applications/pyfa.desktop"

    mkdir -p "$pkgdir/usr/bin/"
    cd "$pkgdir/usr/bin/"
    ln -fs /opt/pyfa/${_distname}.AppImage pyfa
}


