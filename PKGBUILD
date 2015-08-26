# Maintainer: Grigorii Horos <horosgrisa@gmail.com>

_git=e644f90ff7d46a36cb226b969fa4c5c46ed6dae5 # lastest commit 20150806
pkgname=zpm
pkgver=20150826
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
sha256sums=('6a67fd379c14d730c454140be1c855bff09b4f01d706cccb4cfc5efe0816a6f1')

package() {
    install -d ${pkgdir}/usr/share/zpm
    cp -r ${srcdir}/${pkgname}-${_git}/{plugins,zpm.zsh,zshrc-example} ${pkgdir}/usr/share/zpm
    install -D -m644  ${srcdir}/${pkgname}-${_git}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
 