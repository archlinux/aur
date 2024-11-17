# Maintainer: Giovanni De Paola <avvdpaola at proton dot me>

pkgname=slpct

pkgver=1.32.1

pkgrel=2

pkgdesc="free tool for pct  - redattore atti gratuito per il Processo Civile Telematico"

arch=('any')

url="https://github.com/Marx79/Slpct"

license=('GPL-3.0-or-later')


depends=('java-runtime' 'jdk8-openjdk' 'bash' 'xdg-utils' 'git' 'base-devel')



source=('git+https://github.com/Marx79/Slpct.git')

sha256sums=('e9a5411c6ba316bd57a48dd34c1e37a35aea984ff79bf2d9ba113195daa4dea1')



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
