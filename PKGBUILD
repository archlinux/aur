# Maintainer: Mélanie Chauvel (ariasuni) <perso@hack-libre.org>

_appname=hyperspace
pkgname="$_appname-bin"
pkgver=1.0.1
pkgrel=1
epoch=1
pkgdesc='The fluffiest client for the fediverse'
arch=(x86_64)
url='https://hyperspace.marquiskurt.net/'
license=(Apache)
depends=(gconf libappindicator-gtk3 libnotify libxss libxtst nss)
source=("https://github.com/hyperspacedev/hyperspace/releases/download/v${pkgver//_/-}/hyperspace_${pkgver//_/-}_amd64.deb")
sha256sums=('c1ae18f72f8da54e27525cbf12699c4903df2582a7f7c8b5197ab22f115a100a')

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
