# Maintainer: everyx <lunt.luo#gmail.com>
# Maintainer: v9pzm7 <751000925#qq.com>
pkgname=simple-live-app-bin
_build_id=10603
_version=1.6.3
pkgver=${_version}.${_build_id}
pkgrel=1

pkgdesc='简简单单的看直播'
arch=('x86_64')
url='https://github.com/xiaoyaocz/dart_simple_live'
license=('GPL3')

# conflicts=("$pkgname-git" "$pkgname-beta")

source_x86_64=("$pkgname-$pkgver.deb::https://github.com/xiaoyaocz/dart_simple_live/releases/download/v${_version}/simple_live_app-${_version}+${_build_id}-linux.deb")
sha256sums_x86_64=('577abe91413f0750ea4dab044984fbbcdc0d21f360addbfb8b325f981917b0e8')
depends=('libmpv.so' 'xdg-user-dirs')
options=(!debug)

package() {
    bsdtar -xf "$srcdir/data.tar.zst" -C "$pkgdir/"

    install -d "${pkgdir}/usr/bin"
    ln -s /usr/share/simple_live_app/simple_live_app  "${pkgdir}/usr/bin/"
    
    install -d "${pkgdir}/usr/lib"
    ln -s /usr/lib/libmpv.so "${pkgdir}/usr/lib/libmpv.so.1"
}
