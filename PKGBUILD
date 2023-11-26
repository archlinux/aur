# Maintainer: Thorsten Roth <elthoro@gmx.de>
pkgname=inyokaedit
pkgver=0.27.4
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
sha256sums=('14b3bc661c2de31fae63cc099778545c65195f410b3402340bf734388af8edda')

build() {
    cd "$pkgname-$pkgver"
    ./configure --prefix=/usr --community=none
    make app
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install-inyokaedit
}
