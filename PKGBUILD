pkgname=hypo-candy
pkgver=1.7
pkgrel=1
pkgdesc="A custom sugar-candy sddm theme by nixxo"
arch=('any')
url=""
license=('GPL3')
depends=('sddm' 'qt5-graphicaleffects' 'qt5-svg' 'qt5-quickcontrols2')
conflicts=('sddm-sugar-dark')
source=("https://github.com/nixxoq/dotfiles/raw/refs/heads/pkgs/hypo-candy.tar.gz")
md5sums=('885ea6a0b940b6417b46d9cb3c9e6362')

package() {
    install -d "${pkgdir}/usr/share/sddm/themes/${pkgname}"

    tar -xzf "${srcdir}/hypo-candy.tar.gz" -C "${pkgdir}/usr/share/sddm/themes/${pkgname}"
    
    install -Dm644 "${pkgdir}/usr/share/sddm/themes/${pkgname}/AUTHORS" "${pkgdir}/usr/share/licenses/${pkgname}/AUTHORS"
    install -Dm644 "${pkgdir}/usr/share/sddm/themes/${pkgname}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
    install -Dm644 "${pkgdir}/usr/share/sddm/themes/${pkgname}/CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
    
    sudo sed -i '/^\[Theme\]/,/^$/ s/^Current=.*/Current=hypo-candy/' "/etc/sddm.conf" || \
    echo -e "[Theme]\nCurrent=hypo-candy" >> "/etc/sddm.conf"    
}

options=(!strip)
