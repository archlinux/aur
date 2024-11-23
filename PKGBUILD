# Maintainer: Faaris <faaris dot ansari at proton dot me>
_pkgname=electron-nightly
pkgname=${_pkgname}-bin
pkgver=35.0.0.nightly.20241122
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
sha256sums=('df3b670ab5c2627d363bede4186bbb1281a5c3879b688930eb0faa13237cf449')

package() {
    install -dm755 "$pkgdir/usr/lib/$_pkgname" "$pkgdir/usr/bin"
    cp -r "$srcdir"/* "$pkgdir/usr/lib/$_pkgname/"
    ln -sf "/usr/lib/$_pkgname/electron" "$pkgdir/usr/bin/$_pkgname"
}
