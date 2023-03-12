pkgname=1c_enterprise_meta
pkgver=8.3
pkgrel=4
pkgdesc="1C 8.3 metapackage for Linux"
license=('GPL')
arch=('any')
depends=('freetype2' 'gtk3' 'libgsf' 'glib2' 'unixodbc' 'krb5' 'enchant' 'harfbuzz-icu' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'libsecret'
	'libsoup' 'sqlite' 'libxrender' 'libxfixes' 'libxslt' 'geoclue' 'appmenu-gtk-module' 'gcc-libs' 'glib-networking' 'nuspell' 'hspell' 'libvoikko' 'aspell' 'aspell-en' 'aspell-ru')
optdepends=('ttf-ms-fonts: Core TTF Fonts from Microsoft'
	    'aksusbd-bin: Sentinel AKSUSB daemon ')

source=('1cestart-fix.sh' '1cestart-fix.png' '1cestart-fix.desktop')
sha256sums=('6e6102168c091f888e46cd2158ff9ced2f66148e5924b3107046fe9db6d3d548'
            '513fa9b55263b769717fd7ebec62cbd3147d2685686609c3ce906417b4553718'
            'f2fabcd07eb76b7656584058b9805a3f1e2a5c4b6b5cee8c8071957c3c4f2373')
package() {
	cd $srcdir
	install -dm755 ${pkgdir}/usr/lib
	ln -s /usr/lib/libenchant-2.so ${pkgdir}/usr/lib/libenchant.so.1
	#cp 1cestart-fix.png ${pkgdir}/usr/share/icons/hicolor/512x512/apps/ 
	#cp 1cestart-fix.sh ${pkgdir}/usr/bin 

    install -dm755 $pkgdir/usr/bin
    install -Dm755 1cestart-fix.sh $pkgdir/usr/bin/

    install -dm755 $pkgdir/usr/share/1C_Fix
    install -Dm755 1cestart-fix.png $pkgdir/usr/share/1C_Fix
    
    install -dm755  $pkgdir/usr/share/applications
    install -Dm755 1cestart-fix.desktop $pkgdir/usr/share/applications
}
