# Submitter: Seqularise <seqularise (a) outlook.com>
pkgname=plasma5-applets-flipweather
pkgver=0.1
pkgrel=1
pkgdesc="A Plasma widget inspired by the clock and weather widget on HTC's phones and tablets."
arch=('any')
url="https://store.kde.org/p/1646881/"
license=('GPL')
depends=('qt5-graphicaleffects' 'kirigami2')
makedepends=()
source=("https://i-glu4it.ru/qml/org.kde.plasma.flipweather.tar.gz")
md5sums=('144a0e3915e131a26fdaa211f978eb85')

prepare() {
	curl "https://api.kde-look.org/ocs/v1/content/data/1646881" | grep -Eo "(http|https)://[a-zA-Z0-9./?=_%:-]*.tar.gz" | $source
}
package() {
    cd $srcdir/org.kde.plasma.flipweather

    mkdir -p $pkgdir/usr/share/plasma/plasmoids/org.kde.plasma.flipweather
    cp -r * $pkgdir/usr/share/plasma/plasmoids/org.kde.plasma.flipweather
}

