# Maintainer: David Población Criado <davidpblcrd@protonmail.com>
pkgname=nasa-wallpaper
pkgver=2.1
pkgrel=0
pkgdesc="Change your desktop background with a NASA image. You can set an image from the APOD (Astronomical Picture of the Day), the NASA Image Library or the NASA's account in Unsplash"
arch=("i686" "x86_64" "aarch64" "arm")
url="https://github.com/davidpob99/nasa-wallpaper"
license=("Apache")
depends=("glibc")
source=("https://github.com/davidpob99/nasa-wallpaper/releases/download/v2.1.0/nasa-wallpaper-Linux-i686-gnu.tar.gz" "https://github.com/davidpob99/nasa-wallpaper/releases/download/v2.1.0/nasa-wallpaper-Linux-x86_64-gnu.tar.gz" "https://github.com/davidpob99/nasa-wallpaper/releases/download/v2.1.0/nasa-wallpaper-Linux-aarch64-gnu.tar.gz" "https://github.com/davidpob99/nasa-wallpaper/releases/download/v2.1.0/nasa-wallpaper-Linux-arm-gnu.tar.gz")
md5sums=("e8f94bfb6b57dbf2e0b55e45c051a59b" "95700b3c9af4d659c5f8873b5919e391" "1e58e638862ce87f467ce057e0ed1e41" "795dad66208733bb10775763c16c87f7")

package() {
	ARCH="$(uname --m)"
	if [ "$ARCH" = "x86_64" ]; then
	  tar -xf "nasa-wallpaper-Linux-x86_64-gnu.tar.gz"
	fi
	if [ "$ARCH" = "i686" ]; then
	  tar -xf "nasa-wallpaper-Linux-i686-gnu.tar.gz"
	fi
	if [ "$ARCH" = "aarch64" ]; then
	  tar -xf "nasa-wallpaper-Linux-aarch64-gnu.tar.gz"
	fi
	if [ "$ARCH" = "arm" ]; then
	  tar -xf "nasa-wallpaper-Linux-arm-gnu.tar.gz"
	fi

	install -Dm755 nasa-wallpaper /$pkgdir/usr/bin/nasa-wallpaper
}