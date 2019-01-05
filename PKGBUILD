# Maintainer: AUTplayed <fips.hem@gmail.com>
# Contributor: pavanjadhaw <pavanjadhaw96@gmail.com>
pkgname=betterlockscreen
pkgver=2.1
pkgrel=1
pkgdesc="A simple lock script for i3lock-color"
arch=('any')
url="https://github.com/pavanjadhaw/${pkgname}"
license=('MIT')
depends=('i3lock-color' 'imagemagick' 'xorg-xrandr' 'xorg-xdpyinfo' 'bc')
optdepends=('feh: Allows setting wallpaper')
conflicts=("betterlockscreen-git")
source=("${url}/archive/${pkgver}.tar.gz")
md5sums=("a1606e0a74373b12419571e139b90bd0")
install=${pkgname}.install

package() {
	mkdir -p $pkgdir/usr/bin
    cp "$srcdir/${pkgname}-${pkgver}/$pkgname" $pkgdir/usr/bin/$pkgname
    if [[ $(pidof systemd) ]]; then
        _serviceloc="$pkgdir/etc/systemd/system"
        mkdir -p "$_serviceloc"
        _servicename="$pkgname@.service"
        cp "$srcdir/${pkgname}-${pkgver}/$_servicename" "$_serviceloc/$_servicename"
    fi

	#cd "$srcdir/${pkgname}-${pkgver}"
	#mkdir -p $pkgdir/usr/bin
	#cp "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
