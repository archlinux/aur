# Maintainer: Grigorii Horos <horosgrisa@gmail.com>

_git=7add4846d4e9f2319d4e8d9b54ecb2615d260af8 # lastest commit 20150731
_repo=papirus-pack-kde
pkgname=bomi-skin-papirus
pkgver=20150810
pkgrel=1
pkgdesc="Papirus theme for Bomi"
arch=('any')
url="https://github.com/varlesh/${_repo}"
license=('CCPL:by-sa')
options=('!strip')
depends=('bomi')
source=("${_repo}-${pkgver}.tar.gz::${url}/archive/${_git}.tar.gz")
sha256sums=('SKIP')

package() {
    install -d ${pkgdir}/usr/share/bomi/skins
    cp -r ${srcdir}/${_repo}-${_git}/bomi-skins/Papirus ${pkgdir}/usr/share/bomi/skins/
    install -D -m644  ${srcdir}/${_repo}-${_git}/bomi-skins/Papirus/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
} 