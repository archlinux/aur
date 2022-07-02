# Maintainer: ava1ar <mail(at)ava1ar(dot)me>
# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>
# Contributor: Star Brilliant <echo bTEzMjUzQGhvdG1haWwuY29tCg== | base64 -d>
_watch=('https://www.realvnc.com/en/connect/download/vnc/linux/' 'VNC-Server-(\d[\d.]*\d+)-Linux-x64\.deb')

pkgname=realvnc-vnc-server
pkgver=6.10.0
pkgrel=1
pkgdesc='VNC remote desktop server software by RealVNC'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url='https://www.realvnc.com/'
license=('custom')
depends=('libsm' 'libxtst' 'xorg-xauth' 'libxcrypt-compat')
optdepends=('cups: Printer support')
install='realvnc-vnc-server.install'
conflicts=('tightvnc' 'tigervnc' 'turbovnc')
source_x86_64=("https://www.realvnc.com/download/file/vnc.files/VNC-Server-${pkgver}-Linux-x64.deb")
source_i686=("https://www.realvnc.com/download/file/vnc.files/VNC-Server-${pkgver}-Linux-x86.deb")
source_armv7h=("https://www.realvnc.com/download/file/vnc.files/VNC-Server-${pkgver}-Linux-ARM.deb")
source_aarch64=("https://www.realvnc.com/download/file/vnc.files/VNC-Server-${pkgver}-Linux-ARM.deb")
md5sums_x86_64=('e3ac5bfc41ac55d1da7518690a4ede99')
md5sums_i686=('2f6c142232f62bbb48a60b92c6d83935')
md5sums_armv7h=('9d85e3668d48432b9ea5d9920b1c15ac')
md5sums_aarch64=('9d85e3668d48432b9ea5d9920b1c15ac')

package() {
    bsdtar -xv -C "${pkgdir}" -f "${srcdir}/"data.tar.*
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s /usr/share/doc/${pkgname}/copyright "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
