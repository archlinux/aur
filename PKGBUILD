# Maintainer: Grigorii Horos <horosgrisa@gmail.com>

_git=95400ee36ef0b362c36191a9d60c9cea2035e6b4
_repo=papirus-pack-kde
pkgname=papirus-plasma-theme
pkgver=20150823
pkgrel=1
pkgdesc="Modified and adaptive Paper plasma theme for KDE"
arch=('any')
url="https://github.com/varlesh/${_repo}"
license=('CCPL:by-sa')
options=('!strip')
source=("${_repo}-${pkgver}.tar.gz::${url}/archive/${_git}.tar.gz")
sha256sums=('ab301cea99204ffe4a9a4cde42b08e121f1026ded3a7877abbf861fc3778cfe1')

package() {
    install -d ${pkgdir}/usr/share/plasma/desktoptheme
    cp -r ${srcdir}/${_repo}-${_git}/plasma-themes/papirus* ${pkgdir}/usr/share/plasma/desktoptheme/
    install -D -m644  ${srcdir}/${_repo}-${_git}/plasma-themes/papirus/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
} 