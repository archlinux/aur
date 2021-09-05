pkgname=tencent-meeting
pkgver=2.8.0.0
pkgrel=4
pkgdesc="Tencent Meeting Linux Client 腾讯会议Linux客户端"
arch=('x86_64')
url="https://wemeet.qq.com"
license=('unknown')
depends=('nss' 'libx11' 'desktop-file-utils' 'libpulse' 'flac' 'libbsd' 'openssl' 'libxrandr' 'qt5-webkit' 'qt5-x11extras')
makedepends=('tar')
options=(!strip)
provides=('wemeet')
source=("https://updatecdn.meeting.qq.com/ad878a99-76c4-4058-ae83-22ee948cce98/TencentMeeting_0300000000_${pkgver}_x86_64.publish.deb")
md5sums=('bd9afb4c22035c77afb7ac033eeebeee')

package() {
    tar xf data.tar.xz -C "${pkgdir}"
    mv "${pkgdir}/opt/wemeet/icons" "${pkgdir}/usr/share"
    sed -i 'N;2aName[zh_CN]=腾讯会议\nComment=Tencent Meeting Linux Client\nComment[zh_CN]=腾讯会议Linux客户端' "${pkgdir}/usr/share/applications/wemeetapp.desktop"
}
