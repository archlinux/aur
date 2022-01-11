# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=browser360-bin
_pkgname=com.360.browser-stable
pkgver=10.4.1025.4
pkgrel=1
epoch=
pkgdesc="360 Browser stable version"
arch=("x86_64")
url="https://browser.360.cn"
license=('custom')
depends=("nss" "libxss" "alsa-lib" "libxtst" "libcups")
optdepends=()
provides=()
conflicts=()
install=
source=("https://down.360safe.com/gc/signed_${_pkgname}_${pkgver}-${pkgrel}_amd64.deb")
sha256sums=("8e8dcb5f0215bdec2d0f2d7190a2c7c77c783d4262d9d189ae0788094a4cf602")
package() {
	cd "$srcdir"
        tar xf "$srcdir/data.tar.xz"
        cp -r "$srcdir/opt" "$pkgdir/"
        mkdir -p "$pkgdir/usr/share"
        cp -r "$srcdir/opt/apps/${_pkgname}/entries/icons" "$pkgdir/usr/share/"
        install -Dm644 "$srcdir/opt/apps/${_pkgname}/entries/applications/com.360.browser-stable.desktop" "$pkgdir/usr/share/applications/com.360.browser-stable.desktop"
        # sign
         mkdir -p "$pkgdir/apps-data/private/${_pkgname}"
        install -Dm644 "$srcdir/sign" "$pkgdir/apps-data/private/${_pkgname}/sign"

}
