# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
# Contributor: ahmad200512@yandex.ru
pkgname=fantom
pkgver=1.0.68
pkgrel=1
pkgdesc="Programming language supposed to run on top of JVM or CLR or in browser as JavaScript"
arch=('i686' 'x86_64')
url="http://fantom.org/"
license=('custom:Academic Free License 3.0')
depends=('java-runtime')
install=$pkgname.install
source=(https://bitbucket.org/fantom/fan-1.0/downloads/${pkgname}-${pkgver}.zip LICENSE 
 fantom.profile)
md5sums=('ef05ecf4a079c7f0fe84c182ce3423f6'
         '6f6f26e10fee5edcfa0dff72274e6d28'
         '24709c14c5d3b5e12e5bfd2712d7a2f4')
options=('!purge')
replaces=('fan-language')
package() {
  mkdir -p ${pkgdir}/opt/${pkgname}
  rm $srcdir/${pkgname}-${pkgver}/bin/*.exe
  chmod 755 $srcdir/${pkgname}-${pkgver}/bin/*
  cp -R ${srcdir}/${pkgname}-${pkgver}/* ${pkgdir}/opt/${pkgname}
  install -Dm644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/fantom/LICENSE
  install -Dm644 ${srcdir}/fantom.profile ${pkgdir}/etc/profile.d/fantom.sh
}

# vim:set ts=2 sw=2 et:
