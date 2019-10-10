# Maintainer: Mélanie Chauvel (ariasuni) <perso@hack-libre.org>

_appname=hyperspace
pkgname="$_appname-bin"
pkgver='1.0.0_gm'
pkgrel=1
pkgdesc='The fluffiest client for the fediverse'
arch=(x86_64)
url='https://hyperspace.marquiskurt.net/'
license=(Apache)
depends=(gconf libappindicator-gtk3 libnotify libxss libxtst nss)
source=("https://github.com/hyperspacedev/hyperspace/releases/download/v${pkgver//_/-}/hyperspace_${pkgver//_/-}_amd64.deb")
sha256sums=('2260912b715fe6bf9efbe080af16f48d34b47a080f1f92694400825ca0843d38')

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
