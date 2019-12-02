# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=xperia-flashtool
_realname=flashtool
pkgver=0.9.28.0
pkgrel=1
pkgdesc="A S1 protocol flashing software for Sony Xperia phones"
arch=('x86_64')
url="http://www.flashtool.net/"
license=('GPL3')
depends=('libselinux' 'libsystemd' 'glib2' 'mono')
makedepends=('p7zip')
source=("http://url.muflone.com/${pkgname}-${pkgver}-linux.tar.xz"
        "${pkgname}.sh")
sha256sums=('6562f58662a23c3320701dd0bcc0024d6dcd13fd6a3fc2af49ac21829ab5ede2'
            'b6b91cec623461e7b31bc3250045071350237962388ecd6df46bb437bc536803')
options=('!strip')

package() {
  # Install all the program files
  install -m 755 -d "${pkgdir}/usr/lib/${pkgname}"
  cp -rt "${pkgdir}/usr/lib/${pkgname}" FlashTool/*
  # Install launcher scripts
  install -m 755 -d "${pkgdir}/usr/bin"
  install -m 755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
