# Maintainer: enova <enovale at proton dot me>

_pkgname=e1547
pkgname=${_pkgname}-bin
pkgver=21.0.1+103
pkgrel=1
pkgdesc="A sophisticated e621 browser. Debian Package."
arch=('x86_64')
url='https://github.com/clynamic/e1547'
license=('GPL3')
options=('!strip' '!debug')
provides=("${_pkgname}")
conflicts=("e1547-git")

source_x86_64=("${pkgname}-${pkgver}.deb"::"$url/releases/download/$pkgver/${_pkgname}.deb")

prepare() {
    bsdtar -xf "${pkgname}-${pkgver}.deb"

    local datatar
    datatar=$(ls data.tar.* 2>/dev/null | head -n1)
    
    mkdir -p data
    bsdtar -xf "$datatar" -C data
}

package() {
    install -d "$pkgdir/usr/bin"
    cp -a  ${srcdir}/data/* ${pkgdir}/
}

sha256sums_x86_64=('7efe06cd06340f219faf0b6a60f88ec847bb72d2849b7e7467000f0777abe008')
