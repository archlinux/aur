# Maintainer: Thomas Sarboni <tsarboni.ext@orange.com>

pkgname=coopnet-multimedia-conference
_pkgname=MultimediaConference
pkgver=5.1.0
pkgrel=1
pkgdesc='Multimedia conferencing system by Orange Business Services'
arch=('x86_64')
url='https://coopnet.multimedia-conference.orange-business.com'
license=('unknown')
depends=(gtk3 libnotify nss libxtst xdg-utils dbus libappindicator-gtk3 libsecret libxss)
source=("${url}/Setup/EData/EWCE/${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=(c21bb761b702fcabdda137754b7bf71538b03c0f81bf7196ce622f419679ead8)

package() {
    tar -jxf data.tar.bz2 -C "$pkgdir"
    chown -R root. "$pkgdir"/{opt,usr}
    chmod 4755 "${pkgdir}/opt/Multimedia Conference/chrome-sandbox"
    chmod +x "${pkgdir}/opt/Multimedia Conference/multimediaconference"
}
