# Maintainer: Felipe BF <fprgw32 at gmail dot com>
# Contributor: aquova <mail at aquova dot com>

_name=cbconvert
pkgname="${_name}-gtk3-bin"
pkgver=1.2.0
pkgrel=1
pkgdesc="CBconvert is a Comic Book converter (GTK3 version)"
url="https://github.com/gen2brain/${_name}"
arch=("x86_64" "aarch64")
license=("GPL-3.0-only")
conflicts=("${_name}-bin" "${_name}-qt6-bin")
depends=('gtk3' 'gdk-pixbuf2' 'cairo' 'pango' 'at-spi2-core' 'glibc' 'glib2')

source=("cbconvert.desktop")
source_x86_64=("${url}/releases/download/v${pkgver}/${_name}-${pkgver}-linux-x86_64-gtk3.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_name}-${pkgver}-linux-aarch64-gtk3.tar.gz")

sha256sums=('1e7bbaf6fca37f865f59d1f870386c63faab91a57a2d9ce60fa800ffcf4bea15')
sha256sums_x86_64=('d3599f5f384e0dbabf7ebd8727f4c84bce78ca69dc3075e403e24c495f6056e8')
sha256sums_aarch64=('d6aea3d6d0c252f7a20008df9b7f12c415b8b5454d6bf25247a6553fe037213b')

package() {
    cd "${srcdir}/${_name}-${pkgver}"

    install -Dm755 "${_name}" "$pkgdir/usr/bin/${_name}"
    install -Dm755 "${_name}-gui" "$pkgdir/usr/bin/${_name}-gui"

    install -Dm644 "$srcdir/${_name}.desktop" "$pkgdir/usr/share/applications/${_name}.desktop"
}

