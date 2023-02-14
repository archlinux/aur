# Maintainer: ava1ar <mail(at)ava1ar(dot)me>
# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>
# Contributor: Star Brilliant <echo bTEzMjUzQGhvdG1haWwuY29tCg== | base64 -d>
_watch=('https://www.realvnc.com/en/connect/download/vnc/linux/' 'VNC-Server-(\d[\d.]*\d+)-Linux-x64\.deb')

pkgname=realvnc-vnc-server
pkgver=7.0.0
pkgrel=1
pkgdesc='VNC remote desktop server software by RealVNC'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://www.realvnc.com/'
license=('custom')
depends=('libsm' 'libxtst' 'xorg-xauth')
optdepends=('cups: Printer support')
install='realvnc-vnc-server.install'
conflicts=('tightvnc' 'tigervnc' 'turbovnc')
source_x86_64=("https://www.realvnc.com/download/file/vnc.files/VNC-Server-${pkgver}-Linux-x64.deb")
source_armv7h=("https://www.realvnc.com/download/file/vnc.files/VNC-Server-${pkgver}-Linux-ARM.deb")
source_aarch64=("https://www.realvnc.com/download/file/vnc.files/VNC-Server-${pkgver}-Linux-ARM64.deb")
sha256sums_x86_64=('47327acd7fb14e3cd411d48e5a7c3c12ed058bd7d162bd647f3f3990ad16fb97')
sha256sums_armv7h=('dd7a9da2d4e4f92d3c75bae78488408f013aff03df25b0e80f64df5be4494145')
sha256sums_aarch64=('df133033e53b066df19f50cbb6b68b2f0ee1523ffffcb4b98e8e546ff76acd30')

package() {
    bsdtar -xv -C "${pkgdir}" -f "${srcdir}/"data.tar.*
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s /usr/share/doc/${pkgname}/copyright "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
