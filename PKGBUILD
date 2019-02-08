# Maintainer: m8D2 <mimi55 (at) proton mail (dot) com>
# Contributor: Robert Booster <boosterdev at linuxmail dot org>

pkgname=zuki-themes
pkgver=3.30_1
pkgrel=1
pkgdesc="Zuki themes for GNOME, Xfce and more."
arch=('any')
url="https://github.com/lassekongo83/zuki-themes"
license=(GPL3)
depends=(gtk-engine-murrine gtk-engines)
optdepends=(ttf-roboto)
conflits=(zukitwo-themes-git)
source=("$pkgname-$pkgver.tar.gz::https://github.com/lassekongo83/zuki-themes/archive/v${pkgver//_/-}.tar.gz")
sha256sums=('961611bf8f3e3afc64a9707dcd6bbde4daed3f175d6f1689afe9ddbff56b20e2')

package(){
    install -d -m755 "$pkgdir"/usr/share/{themes,licenses/$pkgname}
    cd $(find -maxdepth 1 -type d | grep '[a-z]')
    cp -rp Zuki* "$pkgdir"/usr/share/themes
    install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/${pkgname}/
}
