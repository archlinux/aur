# Maintainer: Mélanie Chauvel (ariasuni) <perso@hack-libre.org>

_appname=hyperspace
pkgname="$_appname-bin"
pkgver='1.0.0_beta7'
pkgrel=1
pkgdesc='The fluffiest client for the fediverse'
arch=(x86_64)
url='https://hyperspace.marquiskurt.net/'
license=(Apache)
depends=(gconf libappindicator-gtk3 libnotify libxss libxtst nss)
source=("https://github.com/hyperspacedev/hyperspace/releases/download/${pkgver//_/}/hyperspace_${pkgver//_/-}_amd64.deb")
sha256sums=('816b21714e8f5eaf8c888e14a2b6670d32eb7684cdfda29f49690600d7df86a1')

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
