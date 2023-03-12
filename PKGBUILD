# Maintainer: ava1ar <mail(at)ava1ar(dot)me>
# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>
# Contributor: Star Brilliant <echo bTEzMjUzQGhvdG1haWwuY29tCg== | base64 -d>
_watch=('https://www.realvnc.com/en/connect/download/vnc/linux/' 'VNC-Server-(\d[\d.]*\d+)-Linux-x64\.deb')

pkgname=realvnc-vnc-server
pkgver=7.0.1
pkgrel=2
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
sha256sums_x86_64=('e875325638a7f26b2c1dbd309aa5abebe038d79729d68e152ff64ec8de0e894c')
sha256sums_armv7h=('9c8d251110c244ad91270be62eac553b4a5c01cb1a72ab37f77478d14e971504')
sha256sums_aarch64=('0e7a265ddc5d3ccf6d63738290de5e82a449d88319c92dcdef32012285b243b7')

package() {
    bsdtar -xv -C "${pkgdir}" -f "${srcdir}/"data.tar.*
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s /usr/share/doc/${pkgname}/copyright "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
