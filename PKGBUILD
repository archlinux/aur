# Maintainer: slwyts <a3144390867@163.com>
# Author: Flysoft <flysoftbeta@hiflysoft.onmicrosoft.com>
pkgname='platinum'
_pkgname='platinum'
pkgver=1.0.0_pre.15
pkgrel=1
epoch=1
pkgdesc="Browse the Web"
arch=('any')
url="https://platinum.flysoftapp.com"
#license=('')
groups=()
depends=('electron' 'ffmpeg')
makedepends=('tar' 'xz')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.lzma::https://slwyts.github.io/tmpv1.tar.lzma")
source=(platinum.png
        ${_pkgname}.desktop
        ${_pkgname}
        $pkgname-$pkgver.tar.lzma::https://slwyts.github.io/tmpv1.tar.lzma
        )
md5sums=('81583bb58c11dc83ec6f872afb21a2ec' 'e648f8ef35a7527d35c01091bad025b4' '1e371bf1065ff136689ee8d290da0c63' 'f0f669f570c5925ef4b143b384299dd2')
validpgpkeys=()

package() {
    install -Dm644 -t "${pkgdir}/usr/share/applications" "${_pkgname}.desktop"
    install -Dm644 "platinum.png" "$pkgdir/usr/share/icons/hicolor/0x0/apps/$_pkgname.png"
    install -Dm755 "${_pkgname}" "${pkgdir}/opt/platinum/${_pkgname}"
    cp -r "app" "${pkgdir}/opt/platinum/app"
    cp -r "engine" "${pkgdir}/opt/platinum/engine"
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
