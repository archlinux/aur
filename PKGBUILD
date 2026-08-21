# Maintainer: MaoYaoTng <maoyaotang@163.com>

pkgname=onedriveqt
_pkgname=OneDriveQt
pkgver=1.4.7
pkgrel=1
pkgdesc="OneDrive Qt6 同步客户端"
arch=('x86_64')
url="https://github.com/maoyaotang12/OneDriveQt"
license=('MIT')
depends=('qt6-base' 'onedrive-abraunegg-git')
makedepends=('cmake' 'gcc' 'make')
source=(git+$url.git
$pkgname.desktop
$pkgname.svg)
sha256sums=('SKIP'
            'bde70d2d73124f8baa7253c35eb4c6a84039fe2904cc5b400cab7e3a12eb8651'
            '64e9313c0da2d0765b920b8f7a6cab895347ff4079bd2b2d5d7d7b636668bcfc')

package() {
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${pkgname}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
    install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
    install -Dm755 ${srcdir}/${_pkgname}/OneDriveQt "$pkgdir/usr/bin/onedriveqt"
}
