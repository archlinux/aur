# Maintainer: Felipe BF <fprgw32 at gmail dot com>
# Contributor: aquova <mail at aquova dot com>

_name=cbconvert
pkgname="${_name}-qt6-bin"
pkgver=1.2.0
pkgrel=1
pkgdesc="CBconvert is a Comic Book converter (QT6 version)"
url="https://github.com/gen2brain/${_name}"
arch=("x86_64" "aarch64")
license=("GPL-3.0-only")
conflicts=("${_name}-bin" "${_name}-gtk3-bin")
depends=('qt6-base' 'libgcc' 'libstdc++' 'glibc')

source=("cbconvert.desktop")
source_x86_64=("${url}/releases/download/v${pkgver}/${_name}-${pkgver}-linux-x86_64-qt6.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_name}-${pkgver}-linux-aarch64-qt6.tar.gz")

sha256sums=('1e7bbaf6fca37f865f59d1f870386c63faab91a57a2d9ce60fa800ffcf4bea15')
sha256sums_x86_64=('2a3c657a49ac74471d31afc041087264988889e36fcd1c86826d5021d3fd3c95')
sha256sums_aarch64=('eb1b45a574d0c0ca39074122b7a0f389ac2fe00660d44bd7acd93ca273e48306')

package() {
    cd "${srcdir}/${_name}-${pkgver}"

    install -Dm755 "${_name}" "$pkgdir/usr/bin/${_name}"
    install -Dm755 "${_name}-gui" "$pkgdir/usr/bin/${_name}-gui"

    install -Dm644 "$srcdir/${_name}.desktop" "$pkgdir/usr/share/applications/${_name}.desktop"
}

