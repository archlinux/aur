# Maintainer: Thorsten Roth <elthoro@gmx.de>
pkgname=inyokaedit
pkgver=0.27.2
pkgrel=1
pkgdesc='Editor for Inyoka based portals'
arch=('i686' 'x86_64')
url='https://github.com/inyokaproject/inyokaedit/'
license=('GPL3')
makedepends=('qt5-tools')
depends=('qt5-webengine' 'hicolor-icon-theme')
optdepends=('inyokaedit-plugins: Plugins for InyokaEdit'
            'inyokaedit-data-ubuntuusersde: ubuntuusers.de community files')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/inyokaproject/inyokaedit/archive/v$pkgver.tar.gz")
sha256sums=('63df49381ddbfaa5ffa8ec823ad12740e2912558f3334bdac674e9ab5ba91571')

build() {
    cd "$pkgname-$pkgver"
    ./configure --prefix=/usr --community=none
    make app
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install-inyokaedit
}
