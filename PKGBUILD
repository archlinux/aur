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
pkgver=1.6
pkgrel=0
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
sha512sums=('3a68d8c76998db5a25060185c7e5707b3b653f8b50883d38c66b7bdfc2dd4fdfd69537cc0a2bc86c8784815a4fcc877735f78562b80ee89f63e4311e7183f0d2')




package() {
    local _themedir="$pkgdir/usr/share/themes"
    install -d "$_themedir/$_pkgname "{Classic,Compact}

    cp -rf $_pkgname-$pkgver/ "$_themedir"/$_pkgname/
    rm "$_themedir"/$_pkgname/.gitignore
    ln -s /usr/share/themes/$_pkgname/xfwm4_compact "$_themedir/$_pkgname Compact/xfwm4"
}
