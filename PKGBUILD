# Maintainer: Giovanni De Paola <avvdepaola at proton dot me>
pkgname=slpct
pkgver=1.33.0
pkgrel=2
pkgdesc="redattore atti gratuito per il Processo Civile Telematico"
arch=('any')
url="https://www.slpct.it/"
license=('GPL-3.0-or-later')


depends=('java-runtime' 'jdk8-openjdk' 'bash' 'xdg-utils' )



source=('https://github.com/Marx79/Slpct/blob/master/slpct.tar.gz')

sha256sums=('SKIP')

license=('GPL-3.0-or-later')


depends=('java-runtime' 'jdk8-openjdk' 'bash' 'xdg-utils' 'git' 'base-devel')



source=('git+https://github.com/Marx79/Slpct.git')

sha256sums=('SKIP')



package() {
	
  tar -xvf "$srcdir/Slpct/slpct.tar.gz"

  install -dm 777 "$pkgdir/usr/es/SLpct"	
  install -Dt  "$pkgdir/usr/es/SLpct/"  -m 777 "$srcdir/SLpct/slpct_run"
  install -Dt  "$pkgdir/usr/es/SLpct/"  -m 777 "$srcdir/SLpct/SLpct.jar" 
  install -Dt  "$pkgdir/usr/es/SLpct/"  -m 777 "$srcdir/SLpct/app6464.png" 
  install -dm 777 "$pkgdir/usr/es/SLpct/certs/"  
  install -Dt "$pkgdir/usr/share/applications/" -m 777 "$srcdir/SLpct/slpctrun1.desktop" 


 
  cp -fR "$srcdir/SLpct/Schemi" "$pkgdir/usr/es/SLpct/" 
  cp -fR "$srcdir/SLpct/lib"    "$pkgdir/usr/es/SLpct/"
  chmod -R 777 "$pkgdir/usr/es/SLpct/"
  
  rm -rf "$srcdir/Slpct"



  
}
 
 
uninstall () {



cd $pkgdir/usr/es/
	rm -rf SLpct
		rm $pkgdir/usr/share/applications/slpctrun1.desktop
 	
 }
