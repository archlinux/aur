# Maintainer:   M.Reynolds <blackboxnetworkproject@gmail.com>
# Contributor:  Bjoern Franke <bjo at nord-west.org>
# Contributor:  flan_suse

pkgname=xfce-theme-greybird
pkgver=3.22.7
pkgrel=1
pkgdesc="A grey and blue Xfce theme."
arch=('any')
url="https://github.com/shimmerproject/Greybird"
license=('CCPL:by-sa-3.0' 'GPL')
groups=('xfce-themes-shimmer-collection')
conflicts=("$pkgname-git")
depends=('gtk-engine-murrine')
optdepends=('elementary-xfce-icons: matching icon set; use the dark icon theme'
            'gtk3: required for CSS/GTK3 theme'
            'lightdm-gtk-greeter: required for the LightDM GTK theme'
            'lightdm-unity-greeter: required for the LightDM Unity theme'
            'shimmer-wallpapers: contains the Greybird wallpaper, among others'
            'lib32-gtk-engine-murrine: required for multilib')
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/shimmerproject/Greybird/archive/v$pkgver.tar.gz")
sha256sums=('0dd54e3f2479030c6a018e001f930998fc8c9517da12437d27335e486c47ebd1')

package() {
    cd "$srcdir"

    install -dm 755 "$pkgdir/usr/share/themes/Greybird Classic"
    install -dm 755 "$pkgdir/usr/share/themes/Greybird Compact"
    install -dm 755 "$pkgdir/usr/share/themes/Greybird a11y"

    cp -r  "Greybird-$pkgver/" "$pkgdir/usr/share/themes/Greybird/"
    rm -rf "$pkgdir/usr/share/themes/Greybird/.gitignore"

    ln -s  "/usr/share/themes/Greybird/xfwm4-compact" \
           "$pkgdir/usr/share/themes/Greybird Compact/xfwm4"

    ln -s  "/usr/share/themes/Greybird/xfwm4-a11y" \
           "$pkgdir/usr/share/themes/Greybird a11y/xfwm4"
}
