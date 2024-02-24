# Maintainer: ava1ar <mail(at)ava1ar(dot)me>
# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>
# Contributor: Star Brilliant <echo bTEzMjUzQGhvdG1haWwuY29tCg== | base64 -d>
_watch=('https://www.realvnc.com/en/connect/download/vnc/linux/' 'VNC-Server-(\d[\d.]*\d+)-Linux-x64\.deb')

pkgname=realvnc-vnc-server
pkgver=7.10.0
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
sha256sums_x86_64=('b4208abac238e0ae57ee3a405baba45f1bf4468f1b417bd9b9b7e248d94f730d')
sha256sums_armv7h=('235143927e202f800e9ada8e8138428c172d63761fbf0f98d7ac2a6bd3ada4b9')
sha256sums_aarch64=('c7489cf07fa661dc19a2851a13df2fef81d937cc595223f547370664e2cf721d')

package() {
    bsdtar -xv -C "${pkgdir}" -f "${srcdir}/"data.tar.*
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s /usr/share/doc/${pkgname}/copyright "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
