# Maintainer: Iru Cai <mytbk920423@gmail.com>

pkgname=liveusb-builder-git
pkgver=2018.09.2.g4fad072
pkgrel=1
pkgdesc='A script suite to create multiboot USB stick for GNU/Linux distributions'
license=('GPL3')
depends=('udevil' 'wget' 'syslinux' 'grub')
arch=('any')
url='https://github.com/mytbk/liveusb-builder'
source=('git+https://git.wehack.space/liveusb-builder'
'buildlive'
)
sha256sums=('SKIP'
'97d01c8a6d88bc12be9f391f605bbf8e1fdf8e1063ea338aa3fb97b68b0db1d2'
)

package() {
	install -d "$pkgdir/opt/liveusb-builder" "$pkgdir/usr/bin"
	cp -r "$srcdir/liveusb-builder"/* "$pkgdir/opt/liveusb-builder"
	install "$srcdir/buildlive" "$pkgdir/usr/bin/"
}

pkgver() {
	cd "$srcdir/liveusb-builder"
	git describe --always | sed 's/-/./g'

}
