# Maintainer: m8D2 <omui (at) proton mail (dot) com>
# Contributor: Robert Booster <boosterdev at linuxmail dot org>

pkgname=zuki-themes
pkgver=3.32_1
pkgrel=1
pkgdesc="Zuki themes for GNOME, Xfce and more."
arch=('any')
url="https://github.com/lassekongo83/zuki-themes"
license=(GPL3)
depends=(gtk-engine-murrine gtk-engines)
optdepends=(ttf-roboto)
conflicts=(zukitwo-themes-git)
source=("$pkgname-$pkgver.tar.gz::https://github.com/lassekongo83/zuki-themes/archive/v${pkgver//_/-}.tar.gz")
sha256sums=('338c2c3e5c8a848ffd1c8b234fa31d2e95ae786305951fc08b7bf9b5fb26dcfc')

package(){
    install -d -m755 "$pkgdir"/usr/share/{themes,licenses/$pkgname}
    cd $(find -maxdepth 1 -type d | grep '[a-z]')
    cp -rp Zuki* "$pkgdir"/usr/share/themes
    install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/${pkgname}/
}
