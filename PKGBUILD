# Maintainer: ava1ar <mail(at)ava1ar(dot)me>
# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>
# Contributor: Star Brilliant <echo bTEzMjUzQGhvdG1haWwuY29tCg== | base64 -d>
_watch=('https://www.realvnc.com/en/connect/download/vnc/linux/' 'body' 'regex' 'VNC-Server-(\d[\d.]*\d+)-Linux-x64\.deb' 'pkgver')

pkgname=realvnc-vnc-server
pkgver=7.18.0
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
sha256sums_x86_64=('f63f1b2285d1361da687e19c2753b87e96104ae4a134597d189fd6976a5852a5')
sha256sums_armv7h=('abb14896bb62fc9ea8b2847fdc1a1ed9902babbb2f296b7b1b47a72db901c3ba')
sha256sums_aarch64=('8cda2bd05d2336441d08b9b18a9f032d8918cf570c9129f53c1cb32841f49568')

package() {
    bsdtar -xv -C "${pkgdir}" -f "${srcdir}/"data.tar.*
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s /usr/share/doc/${pkgname}/copyright "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
