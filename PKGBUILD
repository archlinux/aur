# Contributor: LinuxAcme <lyp@linuxacme.cn>
_pkgname=mrdoc-desktop
pkgname="$_pkgname-bin"
pkgver=0.2.2
pkgrel=2
pkgdesc="MrDoc觅思文档Linux客户端。"
arch=('x86_64')
filename="${_pkgname}_${pkgver}_amd64.deb"
license=('custom:"Copyright (C) 2007 Free Software Foundation, Inc. <http://fsf.org/>"')
url="https://mrdoc.pro/"
depends=('libva')
optdepends=(
	'libva-intel-driver: VA-API implementation for Intel G45 and HD Graphics family'
	'libva-vdpau-driver: VDPAU backend for VA API'
	'libva-utils: Intel VA-API Media Applications and Scripts for libva')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("https://repo.linuxacme.cn/$filename")
sha512sums=('08baec8292c83fe513770fb12c71d6caec0dd583bea422597238f94e249cd22232c68c8bfb9c89a4d8fb08930b0015792dbb2490e05c3e75580a855a78e870fa')

package() {
	bsdtar -xf data.tar.xz -C "$pkgdir/"
	chmod 4755 "$pkgdir/opt/MrDocDesktop/chrome-sandbox"
	find "$pkgdir" -type d -exec chmod 755 {} \;
}
