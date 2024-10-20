# Maintainer: Chester08 <ibrawill08 at gmail dot com>
_pkgname=eucalyptus-drop
pkgname=sddm-$_pkgname
pkgver=2.0.0
pkgrel=1
pkgdesc="Some nice eucalyptus-y eye-candy for SDDM!"
arch=('any')
url="https://gitlab.com/Matt.Jolly/sddm-eucalyptus-drop"
license=('GPL3')
depends=('sddm' 'qt6-5compat' 'qt6-svg')
makedepends=('git')
provides=("sddm-eucalyptus-drop")
conflicts=("sddm-eucalyptus-drop")
install="$pkgname.install"
source=("${pkgname}.tar.bz2::${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2")
sha256sums=('b4a8b6bac1ecf54d0e44ef168ebca2c99130e3da7e0a4170ceb4d0764ec22937')

package() {
    cd "$srcdir/$pkgname-v$pkgver"
    install -d "$pkgdir/usr/share/sddm/themes/${_pkgname}"
    install -Dm644 "Main.qml" "$pkgdir/usr/share/sddm/themes/${_pkgname}/"
    install -Dm644 "theme.conf" "$pkgdir/usr/share/sddm/themes/${_pkgname}/"
    install -Dm644 "metadata.desktop" "$pkgdir/usr/share/sddm/themes/${_pkgname}/"
    find ./Assets -type f -exec install -Dm644 {} "$pkgdir/usr/share/sddm/themes/${_pkgname}/{}" \;
    find ./Backgrounds -type f -exec install -Dm644 {} "$pkgdir/usr/share/sddm/themes/${_pkgname}/{}" \;
    find ./Components -type f -exec install -Dm644 {} "$pkgdir/usr/share/sddm/themes/${_pkgname}/{}" \;
    install -Dm644 "COPYING.md" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.md"
}
