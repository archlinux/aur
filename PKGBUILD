# Contributor: Moises Baca
# Maintainer: Sean McEligot <sean.mceligot@gmail.com>

pkgname=thinkorswim
pkgver=1
pkgrel=4
pkgdesc="Stocks and options trade client"
arch=(i686 x86_64)
url="https://www.thinkorswim.com"
#depends=('jre7')
depends=('java-environment=7')
license=('Copyright')
source=(https://mediaserver.thinkorswim.com/installer/InstFiles/thinkorswim_installer.sh)
sha256sums=('4bf37740d793cccaee69c590932608da775faad99449ea132f77e59458250efb')

build() {
  echo $0 $*
}
pre_upgrade() {
  echo pre_upgrade $*
}
post_install() {
  echo post_install $*
}
install() {
  echo $0 $*
	chmod 700 thinkorswim_installer.sh
  PATH=/usr/lib/jvm/java-7-jre/jre/bin:${PATH}
  export PATH
  
  JAVA_HOME=/usr/lib/jvm/java-7-jre/jre
  export JAVA_HOME 
	./thinkorswim_installer.sh -q -dir /opt/thinkorswim
}
post_remove() {
  echo post_remove $*
  sh /opt/thinkorswim/uninstall
}
prepare() { 
  echo prepare $*
}
package() {
echo package $*
  echo pkgdir ${pkgdir}
  install -Dm755 thinkorswim "${pkgdir}"/usr/bin/thinkorswim
  find ${pkgdir}
	#./thinkorswim_installer.sh -q -dir ${pkgdir}/opt/thinkorswim
  #find ${pkgdir}
}
