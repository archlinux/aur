# Maintainer: Ewout van Mansom <ewout@vanmansom.name>

pkgname=oh-my-zsh-theme-via
_reponame=oh-my-via
pkgver=1.2.0
pkgrel=1
pkgdesc="Historical ZSH theme used on VIA Centrale Réseaux servers"
arch=('any')
url="https://github.com/zsh-users/zsh-autosuggestions"
license=('custom:WTFPL')
depends=('zsh' 'oh-my-zsh-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/badouralix/${_reponame}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('5f8820cc6051e0fdcd47485b92a9d826cca77619bb456bb1032d0ec35bd954deae6c475b3ad8cf454f12bd89ad70b072951f7f9b25bfd2dce4bb43230a3625eb')
b2sums=('4e9358667b946596ddc693e7ceb118f621eaecd439416862d829cb874651717010bc7a4a09b003724dddd90cbbc18245b0e15ff751fa5161397e7d6e02e996a8')

package() {
  cd "${_reponame}-${pkgver}"

  install -Dm 644 via.zsh-theme \
    -t "${pkgdir}/usr/share/oh-my-zsh/custom/themes/${_reponame}/"

  install -Dm 644 functions/* \
    -t "${pkgdir}/usr/share/oh-my-zsh/custom/themes/${_reponame}/functions/"

  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${_reponame}/"
}

