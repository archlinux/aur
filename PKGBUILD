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
        "ngfmsmanager"
        "${pkgname}.desktop")
sha256sums=('bbb7d69f4c74f5ea3eabd24742ed7c96acc9634c6c485359e13f52276daee57b'
            '55c1c96d2ca058cc4c84945a022435658a6a225f44d9032d765fe338c8e63f23'
            '7d5780545fd49fb41fd2f88a4b93a98d682387ca5b59d44ebf25acaee46d363a')


package() {
    cd "${srcdir}/usr/games"
    install -d "${pkgdir}/opt"
    cp -r "navigraph" "${pkgdir}/opt"
    install -Dm644 "navigraph/fms-data-manager/res/256x256.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
    install -Dm755 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm755 "${srcdir}/ngfmsmanager" "${pkgdir}/usr/bin/ngfmsmanager"
}
