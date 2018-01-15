# Maintainer: Amal Karunarathna <nasashinega@gmail.com>

_gitname=caniuse.plugin.zsh
pkgname=caniuse-plugin-zsh-git
pkgver=r8.10b823d
pkgrel=1
pkgdesc='A plugin for oh-my-zsh adding Can I Use... support to your terminal.'
arch=('any')
url="https://github.com/r3b311i0n/${_gitname}"
license=('MIT')
depends=('zsh' 
         'oh-my-zsh-git'
	 'python')
makedepends=('git')
conflicts=('caniuse-plugin-zsh')
options=('!strip')
install="${pkgname}.install"
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver(){
    cd ${_gitname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -Dm644 "${srcdir}/${_gitname}/license.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${_gitname}/${_gitname}" "${pkgdir}/usr/share/oh-my-zsh/custom/plugins/caniuse/${_gitname}"
}
