# Contributor: LinuxAcme <lyp@linuxacme.cn>
_pkgname=mrdoc-desktop
pkgname="$_pkgname-bin"
pkgver=0.2.3
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
sha512sums=('67fd0888097c987d0a56f936406ed7fcdbd3a6d2bcd4aa4f53d1f12370e996666963983d7486a767dae3931be3c180cae80b5f880fc629bb4bf9561db66f0e79')

package() {
	bsdtar -xf data.tar.xz -C "$pkgdir/"
	chmod 4755 "$pkgdir/opt/MrDocDesktop/chrome-sandbox"
	find "$pkgdir" -type d -exec chmod 755 {} \;
}
