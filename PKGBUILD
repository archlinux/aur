# Maintainer: nosada <ngsksdt@gmail.com>
# Contributor: FadeMind <fademind@gmail.com>

pkgname=kdeartwork-aurorae-freeze
_pkgname=Freeze
pkgver=1.5
pkgrel=1
pkgdesc="Window decoration for Aurorae, based on Breeze and Dynamo."
arch=('any')
url="https://store.kde.org/content/show.php/Freeze?content=168737"
license=('GPL')
depends=('plasma-workspace')
source=("${pkgname}-${pkgver}.tar.gz::https://dl.opendesktop.org/api/files/download/id/1475187875/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('968ad2a090050639c2556a025dde4257d8bbe765e1492c77aaabff15a261914489c1b8491f9582af31381f2da44573091b46c7e8d6b7391530b338ee29213bc8')

package() {
    cd "${srcdir}"
    install -d "${pkgdir}/usr/share/aurorae/themes"
    find * -type f -exec install -Dm 644 '{}' "${pkgdir}/usr/share/aurorae/themes/{}" \;
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
}
