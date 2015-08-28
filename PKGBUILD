# Maintainer: Bjoern Franke <bjo at nord-west.org>
# Contributor: flan_suse
#
# This suite contains the following:
#        * xfwm4 theme
#        * xfwm4 compact theme
#        * metacity theme
#        * emerald theme
#        * gtk2 theme
#        * gtk3 theme
#        * unity theme
#        * xfce4-notify theme
#        * lightdm theme
#        * wallpaper (found in the shimmer-wallpapers package; optdepends)

pkgname=xfce-theme-greybird
_pkgname=Greybird
pkgver=1.6.1
pkgrel=1
pkgdesc="A grey and blue Xfce theme, used by default in Xubuntu 12.04"
arch=(any)
url=http://shimmerproject.org/projects/greybird/
license=(CCPL:by-sa-3.0 GPL)
groups=(xfce-themes-shimmer-collection)
depends=(gtk-engine-murrine)
optdepends=('elementary-xfce-icons: matching icon set; use the dark icon theme'
    'gtk3: required for CSS/GTK3 theme'
    'lightdm-gtk-greeter: required for the LightDM GTK theme'
    'lightdm-unity-greeter: required for the LightDM Unity theme'
    'shimmer-wallpapers: contains the Greybird wallpaper, among others'
    'lib32-gtk-engine-murrine: required for multilib')
conflicts=($pkgname-git)
source=($pkgname-$pkgver.tar.gz::https://github.com/shimmerproject/$_pkgname/archive/v$pkgver.tar.gz)
sha512sums=('aa24688505567f31f62f830afd9fbcd2418571fd5a90e61dc71b6f3416352d3f549e2c5054ec8ecd20e83596b255ef262eccfcfc04761ac9dfab6323e3f6a383')




package() {
    local _themedir="$pkgdir/usr/share/themes"
    install -d "$_themedir/$_pkgname "{Classic,Compact}

    cp -rf $_pkgname-$pkgver/ "$_themedir"/$_pkgname/
    rm "$_themedir"/$_pkgname/.gitignore
    ln -s /usr/share/themes/$_pkgname/xfwm4_compact "$_themedir/$_pkgname Compact/xfwm4"
}
