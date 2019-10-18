# Maintainer: Mélanie Chauvel (ariasuni) <perso@hack-libre.org>

_appname=hyperspace
pkgname="$_appname-bin"
pkgver='1.0.0'
pkgrel=1
epoch=1
pkgdesc='The fluffiest client for the fediverse'
arch=(x86_64)
url='https://hyperspace.marquiskurt.net/'
license=(Apache)
depends=(gconf libappindicator-gtk3 libnotify libxss libxtst nss)
source=("https://github.com/hyperspacedev/hyperspace/releases/download/v${pkgver//_/-}/hyperspace_${pkgver//_/-}_amd64.deb")
sha256sums=('52b1c61282c8740a16d7bfddb0e2512392595cf300d48e06cbbc69a9a4244526')

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
