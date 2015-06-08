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
pkgver=1.5.3
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
sha512sums=('1010019b1341cf1c0d48d15d0bc371bbe62e3b6d4aa5d8feb6998093487f465c7dbe42133753a6ca74a01e351ce7b15fcc14c4e194a97034e2e4c171885accae')




package() {
    local _themedir="$pkgdir/usr/share/themes"
    install -d "$_themedir/$_pkgname "{Classic,Compact}

    cp -rf $_pkgname-$pkgver/ "$_themedir"/$_pkgname/
    rm "$_themedir"/$_pkgname/.gitignore
    ln -s /usr/share/themes/$_pkgname/xfwm4_compact "$_themedir/$_pkgname Compact/xfwm4"
}
