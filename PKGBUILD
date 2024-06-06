# Maintainer: David Población Criado <davidpblcrd@protonmail.com>
pkgname=nasa-wallpaper
pkgver=2.1
pkgrel=1
pkgdesc="Change your desktop background with a NASA image. You can set an image from the APOD (Astronomical Picture of the Day), the NASA Image Library or the NASA's account in Unsplash"
arch=("i686" "x86_64" "aarch64" "arm")
url="https://github.com/davidpob99/nasa-wallpaper"
license=("Apache")
depends=("glibc")
source=("https://github.com/davidpob99/nasa-wallpaper/releases/download/v2.1.1/nasa-wallpaper-Linux-i686-gnu.tar.gz" "https://github.com/davidpob99/nasa-wallpaper/releases/download/v2.1.1/nasa-wallpaper-Linux-x86_64-gnu.tar.gz" "https://github.com/davidpob99/nasa-wallpaper/releases/download/v2.1.1/nasa-wallpaper-Linux-aarch64-gnu.tar.gz" "https://github.com/davidpob99/nasa-wallpaper/releases/download/v2.1.1/nasa-wallpaper-Linux-arm-gnu.tar.gz")
md5sums=("07b0c2adc817676af7c26a02345610c7" "bfae387f17e1e5ad9a9c8ac27bf93bd4" "20e17753a726cd702cce90a8ef342947" "531e5edd01d976e289456a036eace254")

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