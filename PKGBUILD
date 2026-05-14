# Maintainer: ava1ar <mail(at)ava1ar(dot)me>
# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>
# Contributor: Star Brilliant <echo bTEzMjUzQGhvdG1haWwuY29tCg== | base64 -d>
_watch=('https://www.realvnc.com/en/connect/download/vnc/linux/' 'body' 'regex' 'VNC-Server-(\d[\d.]*\d+)-Linux-x64\.deb' 'pkgver')

pkgname=realvnc-vnc-server
pkgver=7.17.0
pkgrel=1
pkgdesc='VNC remote desktop server software by RealVNC'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://www.realvnc.com/'
license=('custom')
depends=('libsm' 'libxtst' 'xorg-xauth')
optdepends=('cups: Printer support')
install='realvnc-vnc-server.install'
conflicts=('tightvnc' 'tigervnc' 'turbovnc')
source_x86_64=("https://downloads.realvnc.com/download/file/vnc.files/VNC-Server-${pkgver}-Linux-x64.deb")
source_armv7h=("https://downloads.realvnc.com/download/file/vnc.files/VNC-Server-${pkgver}-Linux-ARM.deb")
source_aarch64=("https://downloads.realvnc.com/download/file/vnc.files/VNC-Server-${pkgver}-Linux-ARM64.deb")
sha256sums_x86_64=('3e000f1c0445e2a05cd2addd281cab383e1a5f5243ae33bfaeb058d92466a4eb')
sha256sums_armv7h=('5fa39cb0b0136dac761769a49386577a84b371b0c04d8760ce3a3a85e9af1054')
sha256sums_aarch64=('baeecbbe3d9b75b6abc4ee0ff34cb5a6fe9f300824a4587b4c76490bc4cf8db3')

package() {
    bsdtar -xv -C "${pkgdir}" -f "${srcdir}/"data.tar.*
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s /usr/share/doc/${pkgname}/copyright "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
