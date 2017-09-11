# Contributor: Star Brilliant <echo bTEzMjUzQGhvdG1haWwuY29tCg== | base64 -d>
# Maintainer: ava1ar <mail(at)ava1ar(dot)me>

pkgname=realvnc-vnc-server
pkgver=6.2.0
pkgrel=1
pkgdesc='VNC remote desktop server software by RealVNC'
arch=('x86_64' 'i686' 'armv7h')
url='https://www.realvnc.com/'
license=('custom')
depends=('glibc' 'gcc-libs' 'libice' 'libsm' 'libx11' 'libxext' 'libxtst' 'gconf')
optdepends=('cups: Printer support')
install='realvnc-vnc-server.install'
conflicts=('tightvnc' 'tigervnc' 'turbovnc')
source_x86_64=("https://www.realvnc.com/download/file/vnc.files/VNC-Server-${pkgver}-Linux-x64.deb")
source_i686=("https://www.realvnc.com/download/file/vnc.files/VNC-Server-${pkgver}-Linux-x86.deb")
source_armv7h=("https://www.realvnc.com/download/file/vnc.files/VNC-Server-${pkgver}-Linux-ARM.deb")
sha1sums_x86_64=('4faca11cc0d9cf1e1fe52f94c7ec43ec7fab5e54')
sha1sums_i686=('a61708a06c649d61b910c90e1c8dc5173a660825')
sha1sums_armv7h=('077427852dd08a8f60109f23c2287150d2d29673')
options=(!strip)

package() {
    bsdtar -xv -C "${pkgdir}" -f "${srcdir}/data.tar.gz"
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s /usr/share/doc/${pkgname}/copyright "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
