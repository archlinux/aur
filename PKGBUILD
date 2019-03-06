# Maintainer: shimi <shimi.chen@gmail.com>

pkgname=chemical-mime-data
pkgver=0_1_94
pkgrel=1
pkgdesc="Chemical MIME type support Linux desktops"
arch=('any')
url="https://github.com/dleidert/chemical-mime"
license=('LGPL')
provides=('chemical-mime-data')
depends=('gnome-mime-data' 'shared-mime-info')
conflicts=('chemical-mime-data-debian' 'chemical-mime-data-git')
makedepends=('libxslt')
source=("https://github.com/dleidert/chemical-mime/archive/release_$pkgver.tar.gz")
sha256sums=('9a795a03b59a861dc1e17f513d95ddb1165cca71658ac62c58bebf00feac6dbc')

build() {
        cd "$srcdir/chemical-mime-release_$pkgver/chemical-mime-data"
        ./autogen.sh
        ./configure --prefix=/usr --disable-nls --without-kde-mime --disable-update-database
        make
}

package() {
        cd "$srcdir/chemical-mime-release_$pkgver/chemical-mime-data"
        make DESTDIR="$pkgdir/" install
}
