# Maintainer: vvxxp8 <concatenate[g] the characters[x] in square[b] brackets[1] in[5] order[3] at gmail dot com>

pkgname=sunlogin-client
_installdir=/opt/${pkgname}
pkgver=10.0.2.24779
pkgrel=1
pkgdesc="Sunlogin Remote Control is a software that supports remote control of mobile devices, Windows, Mac, Linux and other systems. It is the best choice for IT technology, game players, designers and other people with remote management needs."
arch=("x86_64")
url="https://sunlogin.oray.com"
options=("!emptydirs" "!strip")
source=("http://download.oray.com/sunlogin/linux/SunloginClient-${pkgver}_amd64.deb")
sha256sums=("da2a61d106c2cecce271c89cd182b162bce34018539e1ba431580c5bbe120252")

package() {
    bsdtar -xf data.tar.xz -C "$srcdir/"

    sed -i "s+Exec=/usr/local/sunlogin/bin/sunloginclient+Exec=${_installdir}/usr/local/sunlogin/bin/sunloginclient+" "${srcdir}"/usr/share/applications/sunlogin.desktop
    sed -i "s+Icon=/usr/local/sunlogin/res/icon/sunlogin_client.png+Icon=${_installdir}/usr/local/sunlogin/res/icon/sunlogin_client.png+" "${srcdir}"/usr/share/applications/sunlogin.desktop

    cp -R "${srcdir}"/usr ${pkgdir}/${_installdir}
    install -Dm644 "${srcdir}"/usr/share/applications/sunlogin.desktop ${pkgdir}/usr/share/applications/sunlogin.desktop
}
