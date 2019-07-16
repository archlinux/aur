# Maintainer Robert Gonciarz <gonciarz(malpa)gmail.com>
# Upstream author: ohartenstein23

pkgname=openxcom-mod-40k
pkgver=021
pkgrel=1
pkgdesc="The Warhammer 40k - a mod for OpenXcom (OXCE)"
url="https://openxcom.mod.io/40k"
license=('GPLv3')
source=("https://binary.mod.io/mods/9fd8/297/40k_${pkgver}.zip")
sha512sums=('f947e2e0e278debc0c2f9e876a67d70e5fb9568575dfc505a3d10e75ea7a2f479d82063c3c373a54f772c40c56325ba6b159ebe75d5d635eb1fca37b0cd1757f')
arch=('x86_64')
depends=('openxcom')

package() {
    _mod_dest="${pkgdir}/usr/share/openxcom/standard"
    mkdir -p ${_mod_dest}
    for dir in 40k "40k StatStrings" "Blood Angels" "Imperial Fists"; do
        _dest=$(echo $dir | sed -r -e 's|\ |_|')
        find "${srcdir}/${dir}" -type f -exec chmod 644 {} \; 
        cp -dr --no-preserve=ownership "${srcdir}/${dir}" ${_mod_dest}/${_dest} 
    done

}

