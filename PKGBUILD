# Maintainer: Thomas Sarboni <tsarboni.ext@orange.com>

pkgname=coopnet-multimedia-conference
_pkgname=MultimediaConference
pkgver=6.0.0
pkgrel=1
pkgdesc='Multimedia conferencing system by Orange Business Services'
arch=('x86_64')
url='https://coopnet.multimedia-conference.orange-business.com'
license=('unknown')
depends=(gtk3 libnotify nss libxtst xdg-utils dbus libappindicator-gtk3 libsecret libxss)
source=("${url}/Setup/EData/EWCE/${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=(0e4dadb7948565ea57b14e45511673e931bc1126cfd561c6946dde3ebd442aab)

package() {
    tar -jxf data.tar.bz2 -C "$pkgdir"
    chown -R root. "$pkgdir"/{opt,usr}
    chmod 4755 "${pkgdir}/opt/Multimedia Conference/chrome-sandbox"
    chmod +x "${pkgdir}/opt/Multimedia Conference/multimediaconference"
}
