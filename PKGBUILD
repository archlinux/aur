# Maintainer: Grigorii Horos <horosgrisa@gmail.com>

_git=de3fd4a4db0d4fc9b87e898017947e4c22de716a
_repo=papirus-pack-kde
pkgname=papirus-icon-theme
pkgver=20150834 # ;)
pkgrel=1
pkgdesc="Modified and adaptive Paper icon theme for KDE"
arch=('any')
url="https://github.com/varlesh/${_repo}"
license=('CCPL:by-sa')
options=('!strip')
source=("${_repo}-${pkgver}.tar.gz::${url}/archive/${_git}.tar.gz")
sha256sums=('4311bd668b56234428f3d53872961a343764d8c564525cc53a9c49ce5a0ca391')

package() {
    install -d ${pkgdir}/usr/share/icons
    cp -r ${srcdir}/${_repo}-${_git}/icons/papirus* ${pkgdir}/usr/share/icons/
    install -D -m644  ${srcdir}/${_repo}-${_git}/icons/papirus/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
} 