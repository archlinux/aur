# Maintainer: Adam Jędrzejowski <a.jedrzejowski@gmail.com>

pkgname=yosemite-gtk-theme
pkgName=Yosemite-gtk-theme
pkgver=2019.03.18
pkgrel=1
pkgdesc='Mac OSX Yosemite like theme for GTK 3, GTK 2 and Gnome-Shell etc.'
url='https://vinceliuice.github.io/theme-yosemite'
depends=('gtk-engine-murrine' 'gtk-engines')
makedepends=('gawk')
license=('GPL')
arch=('any')

source=("https://github.com/vinceliuice/${pkgName}/archive/master.zip")
sha256sums=('b691720edb3796751f328cbcc15eff3df01f72e47e8dbd6d341d3d02695c887d')

package() {

    gitdir="${srcdir}/${pkgName}-master"
    install1="${gitdir}/Install"
    install2="${install1}2"

    awk 'NR==13{print "DEST_DIR='$pkgdir'/$DEST_DIR"}1' "${install1}" > "${install2}"
    bash ${install2}

    install -Dm644 "$gitdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

