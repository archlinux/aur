# Maintainer: Nadir Boussoukaia <boussou@gmail.com>

# Based on numix-themes
# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Diego <cdprincipe@gmail.com>

pkgname=numix-manjaro-borders
pkgver=1.0.1
pkgrel=1
pkgdesc='Variant of Numix-Manjaro with larger borders (coming from Straight variant)'
arch=('any')
url='http://numixproject.org/'
license=('GPL3')
#install='do.install'
makedepends=('git' 'glib2' 'ruby-sass')

build() {
  cd "$srcdir"
  [-z Numix-Manjaro-Borders] || tar zxvf ../Numix-Manjaro-Borders.tar.gz


}
package() {
  	cd "Numix-Manjaro-Borders"
	for i in `ls *|grep -v xfwm4|grep -v xpm|grep -v png|grep -v themerc`; do 
		
		install -Dm755 $i "$pkgdir/usr/share/themes/Numix-Manjaro-Borders/$i" 
	done

cd "xfwm4"
	for i in `ls *`; do 

		install -Dm755 "$i" "$pkgdir/usr/share/themes/Numix-Manjaro-Borders/xfwm4/$i"
	done

#  make INSTALL_DIR="${pkgdir}/usr/share/themes/Numix-Manjaro-Borders" install
}


