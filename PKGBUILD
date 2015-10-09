# Maintainer: Grigorii Horos <horosgrisa@gmail.com>

_git=343c581a9b534cc92a906fb3ffbe43faa5b74fd2 # lastest commit 20150806
pkgname=zpm
pkgver=20151009
pkgrel=3
pkgdesc="ZPM ( Zsh plugin manager ) is an yet another plugin manager for zsh similar to vim-plug"
arch=('any')
url="https://github.com/horosgrisa/${pkgname}"
license=('LGPL3')
depends=('zsh')
makedepends=('git' 'fakeroot')
install='zpm.install'
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${_git}.tar.gz")
sha256sums=('b6573b8fe5b0e3e46a6d7b94c049c3c46580ad01ba12432382bd46b2701e6ce9')

package() {
    install -d ${pkgdir}/usr/share/zpm
    cp -r ${srcdir}/${pkgname}-${_git}/{plugins,zpm.zsh,zshrc-example} ${pkgdir}/usr/share/zpm
    install -D -m644  ${srcdir}/${pkgname}-${_git}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
 