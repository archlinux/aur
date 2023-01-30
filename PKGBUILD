# Maintainer: JackMoriarty <1413563527@qq.com>
pkgname=battery-wallpaper
pkgver=2.0
pkgrel=1
pkgdesc="A simple bash script to set an animated battery as desktop wallpaper."
arch=('any')
url="https://github.com/adi1090x/battery-wallpaper"
license=('GPL3')
depends=('acpi' 'feh' 'xorg-xrandr')
makedepends=('git')
source=("git+https://github.com/adi1090x/battery-wallpaper.git"
        "battery-wallpaper.patch")
md5sums=('SKIP'
         '371532a292a8ea9e06ca01d75c6225ba')

prepare() {
	cd "$pkgname"
	patch -p1 -i "$srcdir/$pkgname.patch"
}

package() {
	cd "$pkgname"
	PREFIX="$pkgdir/" ./install.sh
}
