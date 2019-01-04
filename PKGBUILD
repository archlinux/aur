# Maintainer: wallace < str(11) + my_id at gmail dot com>

pkgname='kde-service-menu-reimage'
pkgver=2.4
pkgrel=1
pkgdesc='Manipulate images e their metadata'
arch=('any')
url='https://www.egregorion.net'
license=('GPL-3.0+')
depends=('dolphin' 'kdialog' 'imagemagick')
optdepends=('jhead: used for extracting exif data')
source=("https://www.egregorion.net/works/kde/servicemenus/reimage/${pkgname}-${pkgver}_all.tar.gz")
md5sums=('2a598f16634c8117ce4ad4e79edafb84')

package() {
    source_path="${srcdir}/${pkgname}-${pkgver}_all"
    
    # We reproduce the steps from the install script
    bin_dir="$(kf5-config --path exe | sed "s/.*://")"
    install -d "${pkgdir}${bin_dir}"
    install -m 755 ${source_path}/bin/* "${pkgdir}${bin_dir}"
    
    desktop_dir="$(kf5-config --path services | sed "s/.*://")ServiceMenus/"
    install -d "${pkgdir}${desktop_dir}"
    install -m 644 ${source_path}/ServiceMenus/*.desktop "${pkgdir}${desktop_dir}"

    doc_dir="$(kf5-config --prefix)/share/doc/kde-service-menu-steghide/"
    install -d "${pkgdir}${doc_dir}"
    install -m 644 ${source_path}/doc/* "${pkgdir}${doc_dir}"
} 


