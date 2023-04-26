# Maintainer: Thorsten Roth <elthoro@gmx.de>
pkgname=inyokaedit-plugins
pkgver=0.27.3
pkgrel=1
pkgdesc='Plugins for InyokaEdit'
arch=('i686' 'x86_64')
url='https://github.com/inyokaproject/inyokaedit/'
license=('GPL3')
makedepends=('qt5-tools')
depends=('qt5-webengine' 'hunspell')
optdepends=('inyokaedit: Editor for Inyoka based portals'
            'inyokaedit-data-ubuntuusersde: ubuntuusers.de community files')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/inyokaproject/inyokaedit/archive/v$pkgver.tar.gz")
sha256sums=('3a79e2379abd4e1aea375e2e537d2606740f0a8be571d151d94da9bad95598ff')

build() {
    cd "inyokaedit-$pkgver"
    ./configure --prefix=/usr --community=none
    make allplugins
}

package() {
    cd "inyokaedit-$pkgver"
    make DESTDIR="$pkgdir/" install-plugins
}
