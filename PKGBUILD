# Maintainer: Michael Tindal ( mj.tindal @ gmail.com )

pkgname=ffxiv-teamcraft
pkgdesc="Collaborative crafting tool for Final Fantasy XIV"
pkgver=11.4.30
pkgrel=3
arch=('x86_64')
license=('MIT')
utl="https://github.com/ffxiv-teamcraft/ffxiv-teamcraft"
source=(
    FFXIV-Teamcraft.AppImage::https://github.com/ffxiv-teamcraft/ffxiv-teamcraft/releases/download/v${pkgver}/FFXIV-Teamcraft.AppImage
    "FFXIV Teamcraft.desktop"
    "ffxiv-teamcraft_sysusers.conf"
    "ffxiv-teamcraft_tmpfiles.conf"
)
sha1sums=('49cf39d84c48140b83a6597722d4e3ff5d747301'
    '37b0e6795f10261bf76be8d39420b11d14a47180'
    '2f77d7e9e97d5e807e5be3454d536605d1555499'
    'f823cde30c2380ea7bc08f1b7a2747061ec2fdbc')
options=(!strip)

package() {
    mkdir -p ${pkgdir}/usr/lib/sysusers.d/
    mkdir -p ${pkgdir}/usr/lib/tmpfiles.d/
    cp -a ffxiv-teamcraft_sysusers.conf ${pkgdir}/usr/lib/sysusers.d/ffxiv-teamcraft.conf
    cp -a ffxiv-teamcraft_tmpfiles.conf ${pkgdir}/usr/lib/tmpfiles.d/ffxiv-teamcraft.conf
    install -m 755 -D -t ${pkgdir}/opt/ffxiv-teamcraft/ FFXIV-Teamcraft.AppImage
    install -m 644 -D -t ${pkgdir}/usr/share/applications/ "FFXIV Teamcraft.desktop"
}
