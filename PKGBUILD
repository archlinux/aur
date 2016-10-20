# Maintainer: Cédric Devivier <cedric dot devivier chiocciola gmail point com>
_themename="clean"
pkgname=lightdm-webkit2-${_themename}
pkgver=v1.0
pkgrel=1
pkgdesc="Clean LightDM Webkit2 greeter theme"
arch=('any')
url="https://gitlab.com/cdev/${pkgname}"
license=('custom:WTFPL')
depends=('lightdm-webkit2-greeter')
source=( "https://github.com/rufuswilson/${pkgname}/archive/${pkgver}.tar.gz" )
md5sums=('7268ee4ca6633ecab8976774402b64fe')

pkgver() {
    printf "%s" "${pkgver}"
}

build () {
	rm -rf "${srcdir}/${pkgname}"
	mv "${srcdir}/${pkgname}"* "${srcdir}/${pkgname}"
}

package () {
	cd "${srcdir}/${pkgname}"

    install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -D -d "${pkgdir}/usr/share/lightdm-webkit/themes"
    cp -dpr --no-preserve=ownership "${srcdir}/${pkgname}" "${pkgdir}/usr/share/lightdm-webkit/themes/${_themename}"
    rm "${pkgdir}/usr/share/lightdm-webkit/themes/${_themename}/LICENSE"
    rm "${pkgdir}/usr/share/lightdm-webkit/themes/${_themename}/"*".md"
}

