# Maintainer: Mauricio Morales <mocomauricio@gmail.com>

pkgname=xmms
pkgver=1.2.11
pkgrel=1
pkgdesc="X Multimedia System (XMMS) is an audio player for Unix-like systems released under a free software license."
arch=('x86_64')
url="https://www.xmms.org"
license=('GPL')
depends=('esound' 'gtk' 'libmikmod' 'libogg' 'libvorbis' 'mesa' 'zlib')
optdepends=('xmms-skins: skins for XMMS' 
            'xmmplayer: plugin for XMMS that allows you to play video files from within XMMS using MPlayer as a back-end')

install="${pkgname}.install"
source=(http://www.xmms.org/files/1.2.x/$pkgname-$pkgver.tar.bz2
    $pkgname.png
    $pkgname.desktop
    gtkrc.utf8)

md5sums=('f3e6dbaf0b3f571a532ab575656be506'
         '201642b2ccf7cfd7b53ee354430f23dd'
         '8ea0b9669adda795beefb0816050c20d'
         'bb5b05ad8c14edf2798be22df7585505')


prepare() {
	cd xmms-${pkgver}
	sed -i '4192a\\tputenv("XLIB_SKIP_ARGB_VISUALS=1");' xmms/main.c
}

build() {
	cd xmms-${pkgver}
  	./configure --prefix=/usr --mandir=/usr/share/man \
	--disable-static
  	make
}

package() {
	cd xmms-${pkgver}
	make DESTDIR="${pkgdir}" install-strip
    install -Dm644 $srcdir/$pkgname.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
    install -Dm644 $srcdir/$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
    
	install -Dm644 $srcdir/gtkrc.utf8 "$pkgdir"/etc/gtk/gtkrc.es_AR.utf8
	install -Dm644 $srcdir/gtkrc.utf8 "$pkgdir"/etc/gtk/gtkrc.es_BO.utf8
	install -Dm644 $srcdir/gtkrc.utf8 "$pkgdir"/etc/gtk/gtkrc.es_CL.utf8
	install -Dm644 $srcdir/gtkrc.utf8 "$pkgdir"/etc/gtk/gtkrc.es_CO.utf8
	install -Dm644 $srcdir/gtkrc.utf8 "$pkgdir"/etc/gtk/gtkrc.es_CU.utf8
	install -Dm644 $srcdir/gtkrc.utf8 "$pkgdir"/etc/gtk/gtkrc.es_DO.utf8
	install -Dm644 $srcdir/gtkrc.utf8 "$pkgdir"/etc/gtk/gtkrc.es_EC.utf8
	install -Dm644 $srcdir/gtkrc.utf8 "$pkgdir"/etc/gtk/gtkrc.es_ES.utf8
	install -Dm644 $srcdir/gtkrc.utf8 "$pkgdir"/etc/gtk/gtkrc.es_GT.utf8
	install -Dm644 $srcdir/gtkrc.utf8 "$pkgdir"/etc/gtk/gtkrc.es_HN.utf8
	install -Dm644 $srcdir/gtkrc.utf8 "$pkgdir"/etc/gtk/gtkrc.es_MX.utf8
	install -Dm644 $srcdir/gtkrc.utf8 "$pkgdir"/etc/gtk/gtkrc.es_NI.utf8
	install -Dm644 $srcdir/gtkrc.utf8 "$pkgdir"/etc/gtk/gtkrc.es_PA.utf8
	install -Dm644 $srcdir/gtkrc.utf8 "$pkgdir"/etc/gtk/gtkrc.es_PE.utf8
	install -Dm644 $srcdir/gtkrc.utf8 "$pkgdir"/etc/gtk/gtkrc.es_PR.utf8
	install -Dm644 $srcdir/gtkrc.utf8 "$pkgdir"/etc/gtk/gtkrc.es_PY.utf8
	install -Dm644 $srcdir/gtkrc.utf8 "$pkgdir"/etc/gtk/gtkrc.es_SV.utf8
	install -Dm644 $srcdir/gtkrc.utf8 "$pkgdir"/etc/gtk/gtkrc.es_US.utf8
	install -Dm644 $srcdir/gtkrc.utf8 "$pkgdir"/etc/gtk/gtkrc.es_UY.utf8
	install -Dm644 $srcdir/gtkrc.utf8 "$pkgdir"/etc/gtk/gtkrc.es_VE.utf8	
}
