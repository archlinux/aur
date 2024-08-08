# Maintainer: Dee.H.Y <dongfengweixiao AT hotmail DOT com>
pkgname=androidtoolkit-bin
_pkgname=androidtoolkit
pkgver=1.4.4
_pkgver=1
pkgrel=3
pkgdesc="Desktop tools for Android developers, supports Windows, Mac and Linux."
arch=('x86_64')
url="https://github.com/LazyIonEs/AndroidToolKit"
license=('MIT')
conflicts=("androidtoolkit-git" "androidtoolkit")
install="androidtoolkit.install"
depends=(alsa-lib libxrender libglvnd java-runtime libxext libxtst zlib libxi gcc-libs libx11 glibc fontconfig)
source=(
	"${_pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux.deb"
    "https://github.com/LazyIonEs/AndroidToolKit/blob/main/LICENSE"
)
sha256sums=('7a2651b28fed15ac312c9d919846d8ae13be32fe7d14ebf950baced56d83f633'
            '1ab9704c30d635bdb155827c1e3aaca86470eb5cc5216afc43c8391c215c2540')

package() {
    msg "Converting debian package..."
    cd "$srcdir"
    tar -I zstd -xvf data.tar.zst -C "$pkgdir"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    find "$pkgdir" -type d -exec chmod 755 {} \;
    chmod a+x "$pkgdir/opt/androidtoolkit/lib/app/resources/aapt2"
}
