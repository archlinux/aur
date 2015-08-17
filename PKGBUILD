# Maintainer: Grigorii Horos <horosgrisa@gmail.com>

_git=eade2fe14249abd0f134e6aa17508bb14072439a # lastest commit 20150731
_repo=papirus-pack-kde
pkgname=bomi-skin-papirus
pkgver=20150820
pkgrel=1
pkgdesc="Papirus theme for Bomi"
arch=('any')
url="https://github.com/varlesh/${_repo}"
license=('CCPL:by-sa')
options=('!strip')
depends=('bomi')
source=("${_repo}-${pkgver}.tar.gz::${url}/archive/${_git}.tar.gz")
sha256sums=('cefe9895346cfdcb9ce1e3000e09cb74ed96208f4ee369cbde75859377971bc8')

package() {
    install -d ${pkgdir}/usr/share/bomi/skins
    cp -r ${srcdir}/${_repo}-${_git}/bomi-skin/Papirus ${pkgdir}/usr/share/bomi/skins/
    install -D -m644  ${srcdir}/${_repo}-${_git}/bomi-skin/Papirus/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
} 