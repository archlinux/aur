# Maintainer: Thorsten Roth <elthoro@gmx.de>
pkgname=inyokaedit-plugins
pkgver=0.24.0
pkgrel=1
pkgdesc='Plugins for InyokaEdit'
arch=('i686' 'x86_64')
url='https://github.com/inyokaproject/inyokaedit/'
license=('GPL3')
depends=('qt5-webkit' 'hunspell')
optdepends=('inyokaedit: Editor for Inyoka based portals'
            'inyokaedit-data-ubuntuusersde: ubuntuusers.de community files')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/inyokaproject/inyokaedit/archive/v$pkgver.tar.gz")
sha256sums=('de4354e7e4a97a8054c166219db4920947c3d67160022b5474a6f3832692aafe')

build() {
    cd "inyokaedit-$pkgver"
    ./configure --prefix=/usr --community=none
    make allplugins
}

package() {
    cd "inyokaedit-$pkgver"
    make DESTDIR="$pkgdir/" install-plugins
}
