pkgname=fortune-mod-ru
pkgver=1.52
pkgrel=2
pkgdesc="A collection of cookie files for fortune-mod in Russian."
arch=("any")
url="http://jack.kiev.ua/fortune-mod-ru/"
license=('GPL')
groups=()
depends=("fortune-mod")
makedepends=(dos2unix)
checkdepends=()
optdepends=()
conflicts=()
source=("https://jack.kiev.ua/filez/fortune-mod-ru-$pkgver.tar.bz2")
sha256sums=("4df6487d6607c65002544aa7bb22219a3e0b7ab9a4bd3e39fa21526529dd16c9")
replaces=()
backup=()
changelog=ChangeLog

package() {
    cd "$pkgname-$pkgver"
    find . -mindepth 2 -a -type f -a -not -name '*.*' -exec dos2unix {} \;
    make DESTDIR="$pkgdir" INSTALLPATH="/usr/share/fortune/ru" install
}
