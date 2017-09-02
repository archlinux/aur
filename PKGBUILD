# Maintainer: William Osler <william at oslers dot us>
# Contributor: Grego Dadone <grego.dadone at gmail dot com>

pkgname=sddm-old-breeze-theme-tweak
pkgver=5.7
pkgrel=1
pkgdesc="Plasma 5.7 Breeze SDDM Theme, with 24 hour time and smoother user images"
arch=('any')
url="https://github.com/sddm/sddm"
license=('CC-BY-SA')
depends=('sddm' 'plasma-workspace')
conflicts=('sddm-old-breeze-theme')
provides=('sddm-old-breeze-theme')
install="$pkgname.install"
source=("https://github.com/gregodadone/sddm-old-breeze-theme/raw/master/breeze-5.7.tar.gz"
        "${pkgname}.install"
        "24-hour-date.patch"
        "smooth-user-pic.patch")
md5sums=('4be8292c5b47e8b59105334127afa4a8'
         'be5b8bb99f930776c91d580cd36f9cfe'
         '572ad902e6c3b5f32cb4dfb36f17b094'
         'bf79c1ddd0eacc1fac7c73c87927edd3')

package() {
  mkdir -p "${pkgdir}"/usr/share/sddm/themes
  cp -R breeze-5.7 "${pkgdir}"/usr/share/sddm/themes/breeze-5.7
}

prepare() {
    patch -p2 -i 24-hour-date.patch
    patch -p2 -i smooth-user-pic.patch
}
