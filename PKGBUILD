# Maintainer: Slash <demodevil5[at]yahoo[dot]com>

pkgname=quake-qrp-textures
pkgver=1.00
pkgrel=2
pkgdesc="High Quality Textures for Quake from the Quake Revitalization Project (QRP)"
url="http://qrp.quakeone.com/"
license=('custom')
arch=('any')
depends=('quake')
source=("http://bfeared.com/library/quake/qrp/QRP_map_textures_v.1.00.pk3.7z" \
"http://bfeared.com/library/quake/qrp/QRP_normalmap_textures_add-on_v.1.00.pk3.7z")
sha256sums=('ec05b443c77af87d5285f608684c1501158e4a74f03b090115120df7680b990d'
            '474f5845622c71eaf30c9199966ebc53768e5355bf71cdb2b765dae74af4c37e')
PKGEXT='.pkg.tar'

package() {
    # Install Textures
    install -D -m644 ${srcdir}/QRP_map_textures_v.1.00.pk3 \
        ${pkgdir}/opt/quake/id1/QRP_map_textures_v.1.00.pk3

    # Install Noramlmap Textures
    install -D -m644 ${srcdir}/QRP_normalmap_textures_add-on_v.1.00.pk3 \
        ${pkgdir}/opt/quake/id1/QRP_normalmap_textures_add-on_v.1.00.pk3

    # Install License/Readme for base textures
    install -D -m644 ${srcdir}/readme_mtex_v.1.00.txt \
        ${pkgdir}/usr/share/licenses/${pkgname}/readme_mtex_v.1.00.txt

    # Install License/Readme for normalmaps
    install -D -m644 ${srcdir}/readme_mtex_add-on_v.1.00.txt \
        ${pkgdir}/usr/share/licenses/${pkgname}/readme_mtex_add-on_v.1.00.txt
}
