# Maintainer:   M.Reynolds <blackboxnetworkproject@gmail.com>
# Contributor:  Bjoern Franke <bjo at nord-west.org>
# Contributor:  flan_suse

pkgname=xfce-theme-greybird
pkgver=3.22.11
pkgrel=2
pkgdesc="A grey and blue Xfce theme."
arch=('any')
url="https://github.com/shimmerproject/Greybird"
license=('CCPL:by-sa-3.0' 'GPL')
groups=('xfce-themes-shimmer-collection')
conflicts=("$pkgname-git")
makedepends=('meson' 'sassc' 'librsvg')
optdepends=('elementary-xfce-icons: matching icon set; use the dark icon theme'
            'gtk3: required for CSS/GTK3 theme'
            'lightdm-gtk-greeter: required for the LightDM GTK theme'
            'lightdm-unity-greeter: required for the LightDM Unity theme'
            'shimmer-wallpapers: contains the Greybird wallpaper, among others'
            'gtk-engine-murrine: required for gtk2 support'
            'lib32-gtk-engine-murrine: required for multilib')
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/shimmerproject/Greybird/archive/v$pkgver.tar.gz")
sha256sums=('2bd51da36c445157d92c08039814571362d09986cbe19fa3917f1a08fbadbc61')

package() {

    cd "$srcdir/Greybird-$pkgver"
    meson --prefix="$pkgdir/usr" "build"

    cd "build"
    ninja
    ninja install
}
