# Contributor: Yamada Hayao <development@fascode.net>

pkgname=lightdm-webkit2-theme-alter-nosplash
_pkgname=lightdm-webkit2-theme-alter
pkgver=3.0
pkgrel=4
pkgdesc="AlterLinux webkit2 greeter theme"
arch=('any')
url=https://github.com/SereneTeam/lightdm-webkit2-theme-alter
license=('MIT')
depends=('lightdm' 'lightdm-webkit2-greeter')
provides=('lightdm-webkit2-theme-alter')
conflicts=('lightdm-webkit2-theme-alter')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('aeb04d6f0510eb0d456b41fc03f3ccba94ee82d5d53d05e8451323fe29e6d19f')

package () {
    install -Dm644 "${_pkgname}-${pkgver}/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
    mkdir -p "${pkgdir}/usr/share/lightdm-webkit/themes/alter"
    mv "${srcdir}/${_pkgname}-${pkgver}/"* "${pkgdir}/usr/share/lightdm-webkit/themes/alter"
    sed -i "s/#splash-screen {/#splash-screen {\n  display: none;/" "${pkgdir}/usr/share/lightdm-webkit/themes/alter/css/splashscreen.css"
}
