# Maintainer: Thorsten Roth <elthoro@gmx.de>
pkgname=inyokaedit
pkgver=0.27.1
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
sha256sums=('859161521aae7a0f34309b739266ea043dfa7afec40d4c320ab02d6f0baf9ce8')

build() {
    cd "$pkgname-$pkgver"
    ./configure --prefix=/usr --community=none
    make app
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install-inyokaedit
}
