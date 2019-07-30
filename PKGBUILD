# Maintainer: Mélanie Chauvel (ariasuni) <perso@hack-libre.org>

_appname=hyperspace
pkgname="$_appname-bin"
pkgver='1.0.0_beta5'
pkgrel=1
pkgdesc='The fluffiest client for the fediverse'
arch=(x86_64)
url='https://hyperspace.marquiskurt.net/'
license=(MIT)
depends=(gconf libappindicator-gtk3 libnotify libxss libxtst nss)
source=("https://github.com/hyperspacedev/hyperspace/releases/download/${pkgver//_/}/hyperspace_${pkgver//_/-}_amd64.deb")
sha256sums=('f89dbf4664d7c249e521f19991db7cf2808e1489cdd3e99a9ebcd5e7c7246d64')

build() {                                                                                                                                                                                                                           
  cd $srcdir                                                                                                                                                                                                                        
  ar x $(basename $source)                                                                                                                                                                                                          
  tar xf data.tar.xz                                                                                                                                                                                                                
}                                                                                                                                                                                                                                   
                                                                                                                                                                                                                                    
package() {
  cp -R opt/ usr/ $pkgdir
  mkdir $pkgdir/usr/bin
  ln -s "/opt/Hyperspace/hyperspace" $pkgdir/usr/bin/hyperspace
}
