# Maintainer : Beatussum <echo 'YmVhdHVzc3VtQHByb3Rvbm1haWwuY29tCg==' | base64 -d>


_dname=navigraph-fms-data-manager
pkgname=${_dname}-beta
pkgver=1.6.1.1129
pkgrel=3
pkgdesc="A client software which allows you to effortlessly download and install FMS Data for your flight simulation addons and tools"
arch=('x86_64')
url="https://www.navigraph.com/FmsDataManager.aspx"
license=('unknown')
depends=('openssl-1.0')
source=("http://download.navigraph.com/software/fmsdatamanager/${_dname}-${pkgver}.${arch}.rpm"
        "${pkgname}.desktop")
sha256sums=('bbb7d69f4c74f5ea3eabd24742ed7c96acc9634c6c485359e13f52276daee57b'
            '8d781e2207ed19f38c90d7e63600355c5e2761d2cb1f02b2a252cf84b13cb04d')


package() {
    cd "${srcdir}/usr/games"
    install -d "${pkgdir}/opt"
    cp -r "navigraph" "${pkgdir}/opt"
    install -Dm644 "navigraph/fms-data-manager/res/256x256.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
    install -Dm755 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
