# Maintainer: William Franco Abdul Hai <williamhai at hotmail dot com>
pkgname='koi'
pkgver=0.1.2
pkgrel=1
pkgdesc="Switch between light and dark themes on KDE Plasma"
arch=('x86_64')
url="https://github.com/baduhai/Koi"
license=('LGPL3')
depends=('plasma-desktop' 'kconfig' 'kcoreaddons' 'kwidgetsaddons')
makedepends=('qt5-base')
source=("https://github.com/baduhai/Koi/archive/$pkgver.tar.gz")
md5sums=('8a93eec44ebc385714458815277f0ceb')

build() {
	cd "Koi-$pkgver"
    qmake src/Koi.pro
	make
}

package() {
    cd "Koi-$pkgver"
    install -D "Koi" "$pkgdir/usr/bin/Koi"
    install -Dm644 "src/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 "src/resources/icons/$pkgname.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
    install -Dm644 "src/resources/icons/koi_tray.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/koi_tray.svg"
}
