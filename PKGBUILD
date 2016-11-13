# Maintainer: nosada <ngsksdt@gmail.com>
# Contributor: FadeMind <fademind@gmail.com>

pkgname=kdeartwork-aurorae-freeze
_pkgname=Freeze
pkgver=1.4
pkgrel=1
pkgdesc="Window decoration for Aurorae, based on Breeze and Dynamo."
arch=('any')
url="https://store.kde.org/content/show.php/Freeze?content=168737"
license=('GPL')
depends=('plasma-workspace')
source=("${pkgname}-${pkgver}.tar.gz::https://dl.opendesktop.org/api/files/download/id/1475187875/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('682cf9c04a2913ad40fc980f6a5a8a0830e20ff8fb02d4059262a2db14233df8ad052b28ea219d408c6b3df4bce6b07a39bd055bdd4ccfab357cc31c0ecf7b84')

package() {
    cd "${srcdir}"
    install -d "${pkgdir}/usr/share/aurorae/themes"
    find * -type f -exec install -Dm 644 '{}' "${pkgdir}/usr/share/aurorae/themes/{}" \;
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
}
