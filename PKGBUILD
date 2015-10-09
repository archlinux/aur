# Maintainer: Grigorii Horos <horosgrisa@gmail.com>

_git=fad7f041cd3813bdac27a735cc4e31f70f2dd927 # lastest commit 20150806
pkgname=zpm
pkgver=20151009
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
sha256sums=('6813d57b95275f81d55046a8ac2e4111a90780d0b9b8c703c39b13a3bc720a96')

package() {
    install -d ${pkgdir}/usr/share/zpm
    cp -r ${srcdir}/${pkgname}-${_git}/{plugins,zpm.zsh,zshrc-example} ${pkgdir}/usr/share/zpm
    install -D -m644  ${srcdir}/${pkgname}-${_git}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
 