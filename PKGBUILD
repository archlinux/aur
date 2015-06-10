# Maintainer:  jfperini <@jfperini>
# Contributor: jfperini <@jfperini>

pkgname=openasb-client
pkgver=0.8+b1
pkgrel=1
pkgdesc="Software to manage LAN-House and Cyber ​​Café (Client)."
arch=('any')
url="http://www.openasb.com"
license=('GPL v2')
# provides=('')
# conflicts=('')
depends=('gambas3-gb-image>=3.5' 'gambas3-gb-image<=3.99.0' 'gambas3-gb-qt4>=3.5' 'gambas3-gb-qt4<=3.99.0' 'gambas3-gb-form>=3.5' 'gambas3-gb-form<=3.99.0' 'gambas3-gb-crypt>=3.5' 'gambas3-gb-crypt<=3.99.0' 'gambas3-gb-desktop>=3.5' 'gambas3-gb-desktop<=3.99.0' 'gambas3-gb-form-dialog>=3.5' 'gambas3-gb-form-dialog<=3.99.0' 'gambas3-gb-settings>=3.5' 'gambas3-gb-settings<=3.99.0' 'gambas3-gb-form-mdi>=3.5' 'gambas3-gb-form-mdi<=3.99.0' 'gambas3-gb-net>=3.5' 'gambas3-gb-net<=3.99.0' 'gambas3-gb-qt4-ext>=3.5' 'gambas3-gb-qt4-ext<=3.99.0' 'gambas3-gb-qt4-webkit>=3.5' 'gambas3-gb-qt4-webkit<=3.99.0' 'gambas3-gb-sdl-sound>=3.5' 'gambas3-gb-sdl-sound<=3.99.0' 'gambas3-gb-web>=3.5' 'gambas3-gb-web<=3.99.0' 'rsync' 'vino' 'lm_sensors')
md5sums=('b0d5064f5b3e65440b92ed5d6f774189') 
source=("$pkgname.deb"::'http://www.openasb.com/testes/ubuntu/openasb-client_0.7.95-0ubuntu1_all.deb')


package() {

	cd "$srcdir/"
    
    	msg2 "  -> Extracting files..."
    	tar Jxvf  data.tar.xz -C .
    
    	msg2 "  -> Installing program..."
    	install -d $pkgdir/{usr/bin,usr/share}
    	cp -a "$srcdir/usr/bin/$pkgname" "$pkgdir/usr/bin/"
    
    	msg2 "  -> Installing icons..."
    	install -Dm644 "$srcdir/usr/share/pixmaps/$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
    
    	msg2 "  -> Installing .desktop file..."
    	install -Dm644 "$srcdir/usr/share/applications/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    	install -Dm644 "$srcdir/usr/share/applications/$pkgname-root.desktop" "$pkgdir/usr/share/applications/$pkgname-root.desktop"

}

# vim: ts=2 sw=2 et: