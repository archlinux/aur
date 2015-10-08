# Maintainer: Grigorii Horos <horosgrisa@gmail.com>

_git=88e39e9289a8200bfcfd43ca8c516474bfb1eb94 # lastest commit 20150806
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
sha256sums=('60692029f32b304cf99eba35473678c081c7e5a9ef637ec4a6471bc8a89d3f36')

package() {
    install -d ${pkgdir}/usr/share/zpm
    cp -r ${srcdir}/${pkgname}-${_git}/{plugins,zpm.zsh,zshrc-example} ${pkgdir}/usr/share/zpm
    install -D -m644  ${srcdir}/${pkgname}-${_git}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
 