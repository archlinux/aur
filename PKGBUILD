# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Marat "Morion" Talipov  <morion.self@gmail.com>

pkgname=k-zukitwo
pkgver=1.0
pkgrel=3
pkgdesc="A Zukitwo theme for KDE4"
arch=('any')
url="http://kde-look.org/content/show.php/?content=152500"
license=('GPL')
depends=('qtcurve-qt4' 'kdebase-workspace')
source=("K-Zukitwo.tar.gz::http://kde-look.org/CONTENT/content-files/152500-K-Zukitwo.tar.gz"
        "Zukitwo.tar.gz::http://kde-look.org/CONTENT/content-files/157949-Zukitwo.tar.gz")
sha256sums=('7e382aee6708170aaa21d37656ae4fcb425e46ea578f30d3545b590a6702dabc'
	    '9633fdf0030032e5bfedb0e83d0c94d6022122c70559eaf73cc5419aec4ae1cc')

package() {
    cd "${srcdir}"
    find K-Zukitwo.qtcurve -type f -exec install -Dm644 '{}' "${pkgdir}/usr/share/apps/QtCurve/{}" \;
    find KZukitwo.colors -type f -exec install -Dm644 '{}' "${pkgdir}/usr/share/apps/color-schemes/{}" \;
    find Zukitwo/ -type f -name '.directory' -delete
    find Zukitwo/* -type f -exec install -Dm 644 '{}' "${pkgdir}/usr/share/apps/aurorae/themes/{}" \;
} 
