# Maintainer: Iru Cai <mytbk920423@gmail.com>

pkgname=liveusb-builder-git
pkgver=2021.04.9.gec66632
pkgrel=1
pkgdesc='A script suite to create multiboot USB stick for GNU/Linux distributions'
license=('GPL3')
depends=('util-linux' 'libarchive' 'wget' 'syslinux' 'mtools' 'grub')
optdepends=('udisks2: mount partitions on USB drives without being root'
            'udevil: mount partitions on USB drives and ISO images without being root')
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
