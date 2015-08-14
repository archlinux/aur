# Maintainer: Grigorii Horos <horosgrisa@gmail.com>

_git=1070c08c2dab9d4bdcab15591a75e7cb3f8ecde4 # lastest commit 20150806
pkgname=zpm
pkgver=20150815
pkgrel=1
pkgdesc="ZPM ( Zsh plugin manager ) is an yet another plugin manager for zsh similar to vim-plug"
arch=('any')
url="https://github.com/horosgrisa/${pkgname}"
license=('LGPL3')
depends=('zsh')
makedepends=('git' 'fakeroot')
install='zpm.install'
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${_git}.tar.gz")
sha256sums=('efb2e8c6cacb833d91ae6b59442bd1e927d621bbb05b5306b1785d26026d3532')

package() {
    install -d ${pkgdir}/usr/share/zpm
    cp -r ${srcdir}/${pkgname}-${_git}/{plugins,zpm.zsh,zshrc-example} ${pkgdir}/usr/share/zpm
    install -D -m644  ${srcdir}/${pkgname}-${_git}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
 