# Maintainer: Thorsten Roth <elthoro@gmx.de>
pkgname=inyokaedit
pkgver=0.26.0
pkgrel=1
pkgdesc='Editor for Inyoka based portals'
arch=('i686' 'x86_64')
url='https://github.com/inyokaproject/inyokaedit/'
license=('GPL3')
depends=('qt5-webkit' 'hicolor-icon-theme')
optdepends=('inyokaedit-plugins: Plugins for InyokaEdit'
            'inyokaedit-data-ubuntuusersde: ubuntuusers.de community files')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/inyokaproject/inyokaedit/archive/v$pkgver.tar.gz")
sha256sums=('107d33325e8c28573543b8dc7e7587078eca174675e935a0352e337f7718b8ea')

build() {
    cd "$pkgname-$pkgver"
    ./configure --prefix=/usr --community=none
    make app
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install-inyokaedit
}
