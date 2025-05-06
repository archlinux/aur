# Maintainer: mrdotx <klassiker@gmx.de>
pkgname=cinfo
pkgdesc='a fast and minimal system information tool for linux-based operating systems'
pkgver=0.5.12
pkgrel=1
url='https://github.com/mrdotx/cinfo'
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
license=('GPL-3.0-or-later')
provides=('cinfo')
conflicts=('cinfo')
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
b2sums=('7a089e5dc8fee7d9eac72c8159fdfd44c70cc28e11d00cae6ebab3f49b488d701e020aa8a457614cd2239fd703b276260906df0eace75155645d3243fcdd4d77')

package() {
    cd "$pkgname-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install

    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
