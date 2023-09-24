# Maintainer: Martin Stibor <martin.von.reichenberg@proton.me>
# Contributor: BrLi <hidden>
# Contributor: philacs <yue.liu@mail.com>

pkgname=xperia-flashtool
_pkgname=Flashtool
pkgver=0.9.36.0
pkgrel=1
pkgdesc="A S1 protocol flashing software for Sony Xperia phones"
arch=('x86_64')
url="http://www.flashtool.net/"
license=('GPL3')
depends=('libselinux' 'libsystemd' 'glib2' 'mono' 'jre-openjdk' 'java-environment-common')
# ${source} obtained from upstream project ${url}
source=("https://github.com/Androxyde/Flashtool/releases/download/${pkgver}/${_pkgname}-${pkgver}.tar.bz2"
        "${pkgname}.sh")
# Upstream archive and launcher script
md5sums=('SKIP'
         'SKIP')
options=('!strip')

package() {
  # Install program files
  install -m 755 -d "${pkgdir}/usr/lib/${pkgname}"
  cp -rt "${pkgdir}/usr/lib/${pkgname}" Flashtool/*
  # Install launcher scripts
  install -m 755 -d "${pkgdir}/usr/bin"
  install -m 755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
