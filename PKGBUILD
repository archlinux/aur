# Maintainer: David Población <davidpblcrd@protonmail.com>
pkgname=nasa-wallpaper
pkgver=2.0
pkgrel=1
pkgdesc="Change your desktop background with a NASA image. You can set an image from the APOD (Astronomical Picture of the Day), the NASA Image Library or the NASA's account in Unsplash"
arch=("i686" "x86_64")
url="https://github.com/davidpob99/nasa-wallpaper"
license=("Apache")
depends=("openssl")
source=("https://github.com/davidpob99/nasa-wallpaper/releases/download/v2.0/nasa-wallpaper-Linux-x32" "https://github.com/davidpob99/nasa-wallpaper/releases/download/v2.0/nasa-wallpaper-Linux-x64")
md5sums=("dc79feca943788e6fee3fc5f85cce5c8" "22d2037db7ec87f96b69b3c7b05c5994")

package() {
	PKG_CONFIG_PATH=/usr/lib/openssl-1.0/pkgconfig

	ARCH="$(uname --m)"
	if [ "$ARCH" = "x86_64" ]; then
	  mv "nasa-wallpaper-Linux-x64" nasa-wallpaper
	else
	  mv "nasa-wallpaper-Linux-x32" nasa-wallpaper
	fi

	install -Dm755 nasa-wallpaper /$pkgdir/usr/bin/nasa-wallpaper
}