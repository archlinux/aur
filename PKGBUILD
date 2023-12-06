# Maintainer: everyx <lunt.luo#gmail.com>
pkgname=simple-live-app-bin
_build_id=10405
_version=1.4.5
pkgver=${_version}.${_build_id}
pkgrel=1

pkgdesc='简简单单的看直播'
arch=('x86_64')
url='https://github.com/xiaoyaocz/dart_simple_live'
license=('GPL3')

# conflicts=("$pkgname-git" "$pkgname-beta")

source_x86_64=("$pkgname-$pkgver.deb::https://github.com/xiaoyaocz/dart_simple_live/releases/download/v${_version}/simple_live_app-${_version}+${_build_id}-linux.deb")
sha256sums_x86_64=('c73aa5ce6778f62ad3a9c26b80419038c7dedc70db8cdf7e51f98e3b54e41151')
depends=('libmpv.so')

package() {
    bsdtar -xf "$srcdir/data.tar.zst" -C "$pkgdir/"

    install -d "${pkgdir}/usr/bin"
    ln -s /usr/share/simple_live_app/simple_live_app  "${pkgdir}/usr/bin/"
    
    install -d "${pkgdir}/usr/lib"
    ln -s /usr/lib/libmpv.so.2.1.0 "${pkgdir}/usr/lib/libmpv.so.1"
}
