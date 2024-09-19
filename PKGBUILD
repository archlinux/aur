# Maintainer: levinit <levinit at outlook>

pkgname=mockitt
pkgver=6.0.0
pkgrel=1
pkgdesc="A prototyping & collaboration tool.墨刀/modao/mockitt"
arch=('x86_64')
url="https://mockitt.wondershare.com"
license=('custom')
#depends=('')
source=("https://download.wondershare.com/cbs_down/ubuntu-mockitt_full8041.zip")

md5sums=('0b24e091b750554955ea13e7aee3e5fc')

package() {
    cd wondershare-ubuntu
    bsdtar -xvf *Mockitt*.deb
    tar -xvf data.tar.xz -C ${pkgdir}

    #edit app's desktop file
    echo -e '
Name[en]=Mockitt
Comment[en]=A prototyping & collaboration tool
' >>${pkgdir}/usr/share/applications/mockitt.desktop

    chmod -R go-w "${pkgdir}"/usr
    install -dm755 "${pkgdir}/usr/bin"
}

