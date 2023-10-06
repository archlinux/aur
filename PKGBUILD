# contributor: Asuka Minato <i at asukaminato dot eu dot org>
pkgname=shalou
pkgver=6.6.3
pkgrel=1
pkgdesc="沙漏验机 - 是一款专业的苹果验机助手、苹果刷机助手"
arch=(x86_64)
url="www.shalou.net"
license=('custom')
depends=(libxtst
	libxcursor
	cairo
	libxrender
	libxi
	expat
	wayland
	at-spi2-core
	libx11
	alsa-lib
	libxml2
	libdrm
	fontconfig
	libxkbcommon-x11
	qt5-speech
	qt5-location
	qt5-tools
	qt5-websockets
	zlib
	libxkbcommon
	gdk-pixbuf2
	qt5-wayland
	pango
	qt5-base
	libxcomposite
	nspr
	gtk3
	qt5-multimedia
	gstreamer
	freetype2
	gst-plugins-base-libs
	libxdamage
	nss
	libcups
	glib2
	glibc
	dbus
	libxext libxfixes libxcb libglvnd libpulse gcc-libs)
provides=()
options=(!strip) # or it will error
source=("https://app-1320188180.cos.ap-nanjing.myqcloud.com/pc/install/${pkgver}/shalou${pkgver}.deb")
sha256sums=('5200bf5423b8f5c4186d6cfb737d89963cc4077f0d72733594177b5262f6d5a3')

package() {
	bsdtar -xvf data.tar.* -C $pkgdir
	mv $pkgdir/lib/ $pkgdir/usr/lib/
	mv $pkgdir/bin/ $pkgdir/usr/bin/
	chown root:root -R $pkgdir
	chmod 755 $pkgdir/etc/
	chmod 755 $pkgdir/etc/udev/
	chmod 755 $pkgdir/etc/udev/rules.d/
	chmod 755 $pkgdir/opt/
	chmod 755 $pkgdir/usr/
	chmod 755 $pkgdir/usr/bin/
	chmod 755 $pkgdir/usr/lib/
	chmod 755 $pkgdir/usr/lib/udev/
	chmod 755 $pkgdir/usr/lib/udev/rules.d/
	chmod 755 $pkgdir/usr/share/
	chmod 755 $pkgdir/usr/share/applications/
	# todo: a lot of qt5 lib remain undeleted, I am not sure, so I keep them there.
}
