# Maintainer: Thorsten Roth <elthoro@gmx.de>
pkgname=inyokaedit-plugins
pkgver=0.27.4
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
sha256sums=('14b3bc661c2de31fae63cc099778545c65195f410b3402340bf734388af8edda')

build() {
    cd "inyokaedit-$pkgver"
    ./configure --prefix=/usr --community=none
    make allplugins
}

package() {
    cd "inyokaedit-$pkgver"
    make DESTDIR="$pkgdir/" install-plugins
}
