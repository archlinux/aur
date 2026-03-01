# Maintainer: Nocifer <apmichalopoulos at gmail dot com>
# Contributor: Paul Dann <pdgiddie at gmail dot com>

pkgname=multiwatch
pkgver=1.0.1
pkgrel=1
pkgdesc='Forks and watches multiple instances of a program in the same context'
arch=('i686' 'x86_64')
url='https://redmine.lighttpd.net/projects/multiwatch'
license=('MIT')
depends=('libev')
makedepends=('meson')
source=("https://download.lighttpd.net/multiwatch/releases-1.x/multiwatch-${pkgver}.tar.gz")
b2sums=('fb65f92e2105c9b6bebd3078fba4bd8324268d11f742fa395a4271370aee9d7a4e99fa783ae79ac5e453b8b6850098926dae2876e9ebd2efe60cd43c49bfa6bb')

build() {
    cd ${pkgname}-${pkgver}

    meson setup build --prefix "${pkgdir}"/usr
    meson compile -C build
}

package() {
    cd ${pkgname}-${pkgver}

    meson install -C build
}
