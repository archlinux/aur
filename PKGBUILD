# Maintainer: m8D2 <mimi55 (at) proton mail (dot) com>
# Contributor: Robert Booster <boosterdev at linuxmail dot org>

pkgname=zuki-themes
pkgver=3.28_3
pkgrel=2
pkgdesc="Zuki themes for GNOME, Xfce and more."
arch=('any')
url="https://github.com/lassekongo83/zuki-themes"
license=('GPL3')
depends=('gtk-engine-murrine' 'gtk-engines')
optdepends=('ttf-roboto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lassekongo83/zuki-themes/archive/v${pkgver//_/-}.tar.gz")
sha256sums=('3b598986e222f9d5ad0cfd2056036e0eeaad39c86c2a8eeaa98bd2eb8e8d983d')

package(){
    install -d -m755 "$pkgdir"/usr/share/{themes,licenses/$pkgname}
    cd $(find -maxdepth 1 -type d | grep '[a-z]')
    cp -rp Zuki* "$pkgdir"/usr/share/themes
    install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/${pkgname}/
}
