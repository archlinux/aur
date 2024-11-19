# Maintainer: Faaris <faaris dot ansari at proton dot me>
_pkgname=electron-nightly
pkgname=${_pkgname}-bin
pkgver=35.0.0.nightly.20241119
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
sha256sums=('18295fabb274a1149691e185a1c7688faf049ea50e0005a08e827f0f288e072f')

package() {
    install -dm755 "$pkgdir/usr/lib/$_pkgname" "$pkgdir/usr/bin"
    cp -r "$srcdir"/* "$pkgdir/usr/lib/$_pkgname/"
    ln -sf "/usr/lib/$_pkgname/electron" "$pkgdir/usr/bin/$_pkgname"
}
