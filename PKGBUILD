# Maintainer: M0Rf30
pkgname=marytts
pkgver=5.1.2
pkgrel=1
pkgdesc="An open-source, multilingual Text-to-Speech Synthesis platform written in Java"
arch=('i686' 'x86_64')
url="http://mary.dfki.de/"
license=('LGPL')
depends=('java-runtime' 'log4j')
source=("https://github.com/marytts/marytts/releases/download/v$pkgver/$pkgname-$pkgver.zip"
	marytts.sh)

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -dm755 ${pkgdir}/opt/${pkgname}/log
  touch ${pkgdir}/opt/${pkgname}/log/server.log
  chmod 777 ${pkgdir}/opt/${pkgname}/log/server.log
  cp -r * ${pkgdir}/opt/${pkgname}
  rm ${pkgdir}/opt/${pkgname}/bin/*.bat
  install -dm755 ${pkgdir}/etc/profile.d
  install -m755 "${srcdir}"/${pkgname}.sh ${pkgdir}/etc/profile.d/
  
}

md5sums=('c7e74cec8b16a3046a37407e267c036a'
         '78f9ee795d5a14d27ae6d5a6b2b507c3')
md5sums=('99e774dd4c6e791ad916ae76351522f0'
         '78f9ee795d5a14d27ae6d5a6b2b507c3')
