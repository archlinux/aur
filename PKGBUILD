#Maintainer: rerep <f459579b@opayq.com>

pkgname=indicator-bulletin-git
_pkgname=indicator-bulletin
pkgver=r13.f27ac20 
pkgrel=1
pkgdesc="Clipboard manager featuring pinned items and infinite & searchable history."
arch=('any')
url="https://github.com/SergKolo/indicator-bulletin"
license=('MIT')
depends=('zenity' 'python' 'libappindicator-gtk3' )
provides=('indicator-bulletin')
conflicts=('indicator-bulletin')


source=(git+https://github.com/SergKolo/indicator-bulletin.git)

md5sums=('SKIP')

pkgver() {
    cd ${srcdir}/${_pkgname}

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -d "$pkgdir"/{usr/bin,usr/share/applications}
    install "${srcdir}/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install "${srcdir}/${_pkgname}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
