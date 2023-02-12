pkgname=(dexy-theme-git dexy-icons-git)
pkgver=20230211
pkgrel=1
pkgdesc='Dexy Themes For Plasma Desktop'
arch=('any')
url="https://github.com/L4ki/Dexy-Plasma-Themes/"
license=('GPL3')
source=("git+https://github.com/L4ki/Dexy-Plasma-Themes.git")
sha256sums=('SKIP')
options=('!strip')

pkgver() {
    cd "${srcdir}/Dexy-Plasma-Themes"
    git log -1 --format="%cd" --date=short | sed 's|-||g'
}

package_dexy-theme-git() {
    depends=('kvantum')
    optdepends=('dexy-icons-git: Matching icon theme')
    cd "${srcdir}/Dexy-Plasma-Themes"

    # Color
    install -d "$pkgdir"/usr/share/color-schemes
    cp "Dexy ColorSchemes"/* "$pkgdir"/usr/share/color-schemes/

    # GTK TODO
    install -d "$pkgdir"/usr/share/themes
    cp -r "Dexy GTK Themes"/* "$pkgdir"/usr/share/themes/

    # look-and-feel
    install -d "$pkgdir"/usr/share/plasma/look-and-feel
    cp -r "Dexy Global Themes"/* "$pkgdir"/usr/share/plasma/look-and-feel/

    # konsole
    install -d "$pkgdir"/usr/share/konsole
    cp "Dexy Konsole ColorSchemes"/* "$pkgdir"/usr/share/konsole/

    # kvantum
    install -d "$pkgdir"/usr/share/Kvantum
    cp -r "Dexy Kvantum Themes"/* "$pkgdir"/usr/share/Kvantum/

    # plasma
    install -d "$pkgdir"/usr/share/plasma/desktoptheme
    cp -r "Dexy Plasma Themes"/* "$pkgdir"/usr/share/plasma/desktoptheme/

    # splashscreen, where does this go?
    install -d "$pkgdir"/usr/share/plasma/look-and-feel
    cp -r "Dexy SplashScreens"/* "$pkgdir"/usr/share/plasma/look-and-feel/

    # wallpaper
    install -d "$pkgdir"/usr/share/wallpapers/dexy
    cp "Dexy Wallpapers"/* "$pkgdir"/usr/share/wallpapers/dexy/

    # window decorations
    install -d "$pkgdir"/usr/share/aurorae/themes
    cp -r "Dexy Window Decorations"/* "$pkgdir"/usr/share/aurorae/themes/

    # icons
    # install -d "$pkgdir"/usr/share/icons
    # cp -r "Dexy-Color-Icons"/* "$pkgdir"/usr/share/icons/

    # SDDM
    install -d "$pkgdir"/usr/share/sddm/themes
    cp -r Dexy-Color-SDDM "$pkgdir"/usr/share/sddm/themes/Dexy-Color
    cp -r Dexy-SDDM "$pkgdir"/usr/share/sddm/themes/Dexy
}

package_dexy-icons-git() {
    cd "${srcdir}/Dexy-Plasma-Themes"

    # icons
    install -d "$pkgdir"/usr/share/icons
    cp -r "Dexy-Color-Icons"/* "$pkgdir"/usr/share/icons/
    rm "$pkgdir"/usr/share/icons/Dexy-Color-Light-Icons/make-symlinks.sh
}