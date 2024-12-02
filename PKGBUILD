# Maintainer: Faaris <faaris dot ansari at proton dot me>
_pkgname=electron-nightly
pkgname=${_pkgname}-bin
pkgver=35.0.0.nightly.20241202
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
sha256sums=('876142f33822ed9be19c60c4f63568e77e3a9ce71ba748992e9aeaf8eb0e6b53')

package() {
    install -dm755 "$pkgdir/usr/lib/$_pkgname" "$pkgdir/usr/bin"
    cp -r "$srcdir"/* "$pkgdir/usr/lib/$_pkgname/"
    ln -sf "/usr/lib/$_pkgname/electron" "$pkgdir/usr/bin/$_pkgname"
}
