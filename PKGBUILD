# Maintainer: Dee.H.Y <dongfengweixiao AT hotmail DOT com>
pkgname=androidtoolkit-bin
_pkgname=androidtoolkit
pkgver=1.4.4
_pkgver=1
pkgrel=2
pkgdesc="Desktop tools for Android developers, supports Windows, Mac and Linux."
arch=('x86_64')
url="https://github.com/LazyIonEs/AndroidToolKit"
license=('MIT license')
conflicts=("androidtoolkit-git" "androidtoolkit")
install="androidtoolkit.install"
depends=()
source=(
	"${pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux.deb"
)
sha256sums=('7a2651b28fed15ac312c9d919846d8ae13be32fe7d14ebf950baced56d83f633')

package() {
    msg "Converting debian package..."
    cd "$srcdir"
    tar -I zstd -xvf data.tar.zst -C "$pkgdir"
    find "$pkgdir" -type d -exec chmod 755 {} \;
    chmod a+x "$pkgdir/opt/androidtoolkit/lib/app/resources/aapt2"
}
