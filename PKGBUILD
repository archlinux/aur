# Maintainer: Philip Abernethy<chais.z3r0@gmail.com>
pkgname='ittledew'
pkgver='1.4'
pkgrel=1
pkgdesc='A 2D adventure in the style of classic Zelda games'
arch=('x86' 'x86_64')
url='http://www.ittledew.com/'
license=('custom:commercial')
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')

source=("hib://ittledew_Linux_${pkgver}.zip")
sha512sums=('e5e792a20a02bff33d351ea378ff10356ebf1c6d23df8ded0d6750d5173ab6cc652473c37cbb6aa0c83f5372b9c24608f0d32e22da0a04ad465c81e1ba01096e')

package() {
	mkdir -p $pkgdir/{opt,usr/{bin,share/applications}}
	mv "$srcdir/ittledew_Linux_${pkgver}" "$pkgdir/opt/$pkgname"
	ln -s /opt/$pkgname/IttleDew_linux.x86 $pkgdir/usr/bin/$pkgname
	echo "[Desktop Entry]
Type=Application
Name=Ittle Dew
GenericName=Ittle Dew
Comment=$pkgdesc
Icon=/opt/$pkgname/IttleDew_linux_Data/Resources/UnityPlayer.png
Exec=/usr/bin/$pkgname
Categories=Game;
Path=/opt/$pkgname" > $pkgdir/usr/share/applications/${pkgname}.desktop
}
