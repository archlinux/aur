# Maintainer: Faaris <faaris dot ansari at proton dot me>
_pkgname=electron-nightly
pkgname=${_pkgname}-bin
pkgver=35.0.0.nightly.20241113
pkgrel=1
pkgdesc="Electron Nightly build for Linux - Binary version"
arch=('x86_64')
url="https://github.com/electron/nightlies"
license=('MIT')
depends=('glibc' 'gtk3' 'nss' 'libxss' 'libnotify')

_ver_main="${pkgver%%.nightly.*}"
_ver_date="${pkgver##*.}"
_file_name="electron-v${_ver_main}-nightly.${_ver_date}-linux-x64.zip"
source=("$url/releases/download/v${_ver_main}-nightly.${_ver_date}/${_file_name}")
sha256sums=('e53ccb5f940136ad3667226d3d085ab4dc46c94ce94001a291f1a223bb2eba90')

package() {
    install -dm755 "$pkgdir/usr/lib/$_pkgname" "$pkgdir/usr/bin"
    cp -r "$srcdir"/* "$pkgdir/usr/lib/$_pkgname/"
    ln -sf "/usr/lib/$_pkgname/electron" "$pkgdir/usr/bin/$_pkgname"
}
