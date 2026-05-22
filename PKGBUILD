# Maintainer: MaoYaoTang <maoyaotang@163.com>

pkgname=liveplayer-iptv
pkgver=1.1.1
pkgrel=1
pkgdesc="基于 mpv 简单看在线直播,在线更新直播源"
arch=('x86_64')
url="https://github.com/maoyaotang12/LivePlayer"
license=('MIT')
depends=('qt5-base' 'mpv')
makedepends=('cmake' 'gcc' 'make')
source=(git+$url.git
${pkgname}.desktop
LivePlayer.svg
LICENSE)
sha256sums=('SKIP'
            '05bbced6cb9ba843a49c605ce6b496d503f7e5c51978fb2f8d68c8201b5bf8b2'
            'ac2e63ad697bdd6d899d833372178f6f98b7cc8f035ae55a08cc6786518830d1'
            '46ef102a35cb6843b675efed858efe2fe9d3af0d353ce2feeddfb66bc9dfd1ee')

package() {
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "LivePlayer.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/LivePlayer.svg"
    install -Dm644 "LICENSE" "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    cd "${srcdir}/LivePlayer"
    install -Dm755 LivePlayer "${pkgdir}/usr/bin/LivePlayer"
}
