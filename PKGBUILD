# Maintainer  shtrophic   <aur at shtrophic dot net>
# Contributor epsilonKNOT <epsilon.aur@epsilonKNOT.xyz>

pkgbase=imsg-compat
pkgname=imsg-compat
pkgver=8.0.0
pkgrel=2
pkgdesc="linux port of OpenBSD imsg utilities"
url="https://github.com/bsd-ac/imsg-compat"
license=('ISC')
arch=(x86_64 aarch64 armv7h)
makedepends=(meson)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bsd-ac/imsg-compat/archive/${pkgver}.tar.gz" )
sha256sums=('5e87b828af6c42a1234044ff94b2948bd5802c161c837adb1dece5cfe875aefd')

build() {
    arch-meson $pkgname-$pkgver build
    meson compile -C build
}

check() {
    meson test -C build --print-errorlogs
}

package() {
    meson install -C build --destdir "$pkgdir"
}

