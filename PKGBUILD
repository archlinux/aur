# Maintainer: Cédric Devivier <cedric dot devivier chiocciola gmail point com>
_themename="clean"
pkgname=lightdm-webkit2-${_themename}
pkgver=v1.1
pkgrel=1
pkgdesc="Clean LightDM Webkit2 greeter theme"
arch=('any')
url="https://github.com/rufuswilson/${pkgname}"
license=('custom:WTFPL')
depends=('lightdm-webkit2-greeter')
source=( "https://github.com/rufuswilson/${pkgname}/archive/${pkgver}.tar.gz" )
md5sums=('4f3a7b42bf5abf1a4c584cf84e8bb547')

pkgver() {
    printf "%s" "${pkgver}"
}

build () {
	rm -rf "${srcdir}/${pkgname}"
	mv "${srcdir}/${pkgname}"* "${srcdir}/${pkgname}"
}

package () {
    cd "${srcdir}/${pkgname}"
    install -D -m644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -d "${pkgdir}/usr/share/lightdm-webkit/themes"
    cp -dpr --no-preserve=ownership "${srcdir}/${pkgname}" "${pkgdir}/usr/share/lightdm-webkit/themes/${_themename}"
    rm "${pkgdir}/usr/share/lightdm-webkit/themes/${_themename}/LICENSE"
    rm "${pkgdir}/usr/share/lightdm-webkit/themes/${_themename}/"*".md"
}

