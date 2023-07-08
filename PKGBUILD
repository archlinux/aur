# Maintainer Robert Gonciarz <gonciarz(malpa)gmail.com>
# Upstream author: ohartenstein23

pkgname=openxcom-mod-40k
pkgver=35.1
pkgrel=1
pkgdesc="The Warhammer 40k - a mod for OpenXcom (OXCE)"
url="https://openxcom.mod.io/40k"
license=('GPL3')
source=("https://binary.modcdn.io/mods/9fd8/297/40k_${pkgver}-fyqc.zip")
sha512sums=('0b5189ef9c808648048e766f686451a037ed365f9e7ee1cce505d8f3f64ac6eaf7dfe083e9e38220fcdd2606a065b3405c7437eb4fd1d1ec8408803420143746')
arch=('x86_64')
depends=('openxcom')

package() {
    _mod_dest="${pkgdir}/usr/share/openxcom/standard"
    mkdir -p ${_mod_dest}
    for dir in "40k" "Blood Angels" "Imperial Fists" "Salamanders"; do
        _dest=$(echo $dir | sed -r -e 's|\ |_|')
        find "${srcdir}/${dir}" -type f -exec chmod 644 {} \; 
        cp -dr --no-preserve=ownership "${srcdir}/${dir}" ${_mod_dest}/${_dest} 
    done

}

