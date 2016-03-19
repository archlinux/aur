# Maintainer: nosada <ngsksdt@gmail.com>
# Contributor: FadeMind <fademind@gmail.com>

pkgname=kdeartwork-aurorae-freeze
pkgver=1.3
pkgrel=1
pkgdesc="Window decoration for Aurorae, based on Breeze and Dynamo."
arch=('any')
url="http://kde-look.org/content/show.php/Freeze?content=168737"
license=('GPL')
#depends=('kdebase-workspace')
depends=('plasma-workspace')
source=("${pkgname}-${pkgver}.tar.gz::http://kde-look.org/CONTENT/content-files/168737-Freeze-${pkgver}.tar.gz")
sha256sums=('f27f33cc980ee7be594a87377253b9ae455c2d7f5d71f553acb73276f9d87b37')

package() {
    cd "${srcdir}"
    install -d "${pkgdir}/usr/share/aurorae/themes"
    find * -type f -exec install -Dm 644 '{}' "${pkgdir}/usr/share/aurorae/themes/{}" \;
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
}
