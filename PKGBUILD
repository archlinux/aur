# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=xperia-flashtool
_realname=flashtool
pkgver=0.9.24.4
pkgrel=1
pkgdesc="A S1 protocol flashing software for Sony Xperia phones"
arch=('x86_64')
url="http://www.flashtool.net/"
license=('unknown')
depends=('libselinux' 'libsystemd' 'glib2' 'mono')
makedepends=('p7zip')
source=("http://url.muflone.com/${pkgname}-${pkgver}-linux.tar.7z"
        "${pkgname}.sh")
sha256sums=('77ceace646cd30195839d3fb39ca116e4a5a2ce63f781acc57098e6b3532ed4d'
            'b6b91cec623461e7b31bc3250045071350237962388ecd6df46bb437bc536803')
options=('!strip')

build() {
  tar xf "${_realname}-${pkgver}-linux.tar"
}

package() {
  # Install all the program files
  install -m 755 -d "${pkgdir}/usr/lib/${pkgname}"
  cp -rt "${pkgdir}/usr/lib/${pkgname}" FlashTool/*
  # Install launcher scripts
  install -m 755 -d "${pkgdir}/usr/bin"
  install -m 755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
