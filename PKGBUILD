# Contributor: David Sotelo <dvsotelo@gmail.com>

pkgname=portecle
pkgver=1.7
pkgrel=2
pkgdesc="User friendly GUI application for creating, managing and examining key stores."
arch=('any')
url="http://portecle.sourceforge.net/"
license=('GPL')
depends=('java-environment' 'bash' 'desktop-file-utils')
install='portecle.install'
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.zip
        portecle.sh)
md5sums=('c01754e2a298139f08fbb59d39d861df'
         '443c7296b801e9372b56d0a4daa76f0c')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -D -m755 ${srcdir}/portecle.sh ${pkgdir}/usr/bin/portecle
  install -D -m644 portecle.jar ${pkgdir}/usr/share/java/${pkgname}/portecle.jar
  install -D -m644 bcprov.jar ${pkgdir}/usr/share/java/${pkgname}/bcprov.jar

  install -D -m644 portecle.desktop ${pkgdir}/usr/share/applications/portecle.desktop
  install -D -m644 portecle.png ${pkgdir}/usr/share/pixmaps/portecle.png
}

# vim:set ts=2 sw=2 et:
