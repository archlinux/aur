# Maintainer: grimi <grimi at poczta dot fm>

pkgname=numix-themes-green
pkgver=2.5.1
pkgrel=2
pkgdesc="A flat and light theme with a modern look using Green color (GNOME, MATE, Openbox, Unity, XFCE)"
arch=('any')
url='http://numixproject.org/'
license=('GPL3')
depends=('gtk-engine-murrine')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/shimmerproject/Numix/archive/v${pkgver}.tar.gz")
md5sums=('4468cb3f2fe0d01e823df7c310778787')


prepare() {
   cd Numix-${pkgver}
   for f in gtk-2.0/gtkrc \
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
         xfwm4/*.xpm \
         unity/*.svg \
         index.theme
   do
      sed -i 's/#fc6f5d/#697740/Ig' "${f}"
      sed -i 's/#d64937/#697740/Ig' "${f}"
      sed -i 's/Numix/Numix-Green/' "${f}"
   done
}

package() {
   cd Numix-${pkgver}
   rm -rf .git .gitignore CREDITS LICENSE README.md
   install -dm 755 "${pkgdir}"/usr/share/themes/Numix-Green
   cp -dr --no-preserve='ownership' * "${pkgdir}"/usr/share/themes/Numix-Green
}

