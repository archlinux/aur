# Maintainer: Thorsten Roth <elthoro@gmx.de>
pkgname=inyokaedit-plugins
pkgver=0.27.3
pkgrel=2
pkgdesc='Plugins for InyokaEdit'
arch=('i686' 'x86_64')
url='https://github.com/inyokaproject/inyokaedit/'
license=('GPL3')
makedepends=('qt5-tools')
depends=('qt5-webengine' 'hunspell')
optdepends=('inyokaedit: Editor for Inyoka based portals'
            'inyokaedit-data-ubuntuusersde: ubuntuusers.de community files')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/inyokaproject/inyokaedit/archive/v$pkgver.tar.gz")
sha256sums=('21606e7f71fb044b79742fdaee21d25574b5a969b19c8e0379667cefc281e47d')

build() {
    cd "inyokaedit-$pkgver"
    ./configure --prefix=/usr --community=none
    make allplugins
}

package() {
    cd "inyokaedit-$pkgver"
    make DESTDIR="$pkgdir/" install-plugins
}
