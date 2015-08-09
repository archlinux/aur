# Maintainer: grimi <grimi at poczta dot fm>

_pkgname=numix-themes
pkgname=numix-themes-green
pkgver=2.5.1
pkgrel=1
pkgdesc="A flat and light theme with a modern look using Green color (GNOME, MATE, Openbox, Unity, XFCE)"
arch=('any')
url='http://numixproject.org/'
license=('GPL3')
depends=('gtk-engine-murrine')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/shimmerproject/Numix/archive/v${pkgver}.tar.gz")
sha256sums=('64b0c34c49633879c8b0b9b685da7b927501ab6db265db15fed04705c04f935b')


prepare() {
   cd Numix-${pkgver}
   for FILE in gtk-2.0/gtkrc \
         gtk-3.0/gtk-dark.css \
         gtk-3.0/gtk-widgets-assets.css \
         gtk-3.0/gtk-widgets.css \
         gtk-3.0/gtk.css \
         gtk-3.0/settings.ini \
         gtk-3.0/apps/gnome-applications.css \
         gtk-3.0/apps/granite-widgets.css \
         gtk-3.0/apps/lightdm-gtk-greeter.css \
         gtk-3.0/apps/nemo.css \
         gtk-3.0/apps/synaptic.css \
         gtk-3.0/apps/unity.css \
         gtk-3.0/apps/xfce.css \
         gtk-3.0/assets/*.svg \
         metacity-1/metacity-theme-2.xml \
         metacity-1/metacity-theme-3.xml \
         openbox-3/themerc \
         xfce-notify-4.0/gtkrc \
         xfwm4/themerc \
         index.theme
   do
      sed -i 's/#fc6f5d/#697740/g' "${FILE}"
      sed -i 's/#d64937/#697740/g' "${FILE}"
      sed -i 's/Numix/Numix-Green/' "${FILE}"
   done
}

package() {
   cd Numix-${pkgver}
   rm -rf .git .gitignore CREDITS LICENSE README.md
   install -dm 755 "${pkgdir}"/usr/share/themes/Numix-Green
   cp -dr --no-preserve='ownership' * "${pkgdir}"/usr/share/themes/Numix-Green
}

