# Maintainer: slwyts <a3144390867@163.com>
# Author: Flysoft <flysoftbeta@hiflysoft.onmicrosoft.com>
pkgname='platinum'
_pkgname='platinum'
pkgver=1.0.0
pkgrel=1
epoch=2
pkgdesc="Platinum Web Browser"
arch=('any')
url="https://platinum.flysoftbeta.cn"
#license=('')
groups=()
depends=('electron' 'ffmpeg' 'aria2')
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
source=("$pkgname-$pkgver.tar.xz::https://vue-slwyts.vercel.app/app.tar.xz")
source=(platinum.png
        ${_pkgname}.desktop
        ${_pkgname}
        $pkgname-$pkgver.tar.xz::https://vue-slwyts.vercel.app/app.tar.xz
        )
md5sums=('81583bb58c11dc83ec6f872afb21a2ec' 'e648f8ef35a7527d35c01091bad025b4' '1e371bf1065ff136689ee8d290da0c63' '9c21ae3b075500411fc8282a551eb56d')
validpgpkeys=()

package() {
    install -Dm644 -t "${pkgdir}/usr/share/applications" "${_pkgname}.desktop"
    install -Dm644 "platinum.png" "$pkgdir/usr/share/icons/hicolor/0x0/apps/$_pkgname.png"
    install -Dm755 "${_pkgname}" "${pkgdir}/opt/platinum/${_pkgname}"
    cp -r "app" "${pkgdir}/opt/platinum/app"
    #cp -r "engine" "${pkgdir}/opt/platinum/engine"
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
