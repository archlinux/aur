# Maintainer: Ewout van Mansom <ewout@vanmansom.name>

pkgname=oh-my-zsh-theme-via
_reponame=oh-my-via
pkgver=1.3.0
pkgrel=1
pkgdesc="Historical ZSH theme used on VIA Centrale Réseaux servers"
arch=('any')
url="https://github.com/zsh-users/zsh-autosuggestions"
license=('custom:WTFPL')
depends=('zsh' 'oh-my-zsh-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/badouralix/${_reponame}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('6e28c3a908b1439a1f08535eff56658c7bb5238d2eab5c9251ed80c4ef44c696ba2f7cce6a648f3ef4ea541d8e86324e36f2b66f975cfc5b7df431eb6c038047')
b2sums=('a590c0ff2f19fbd95af975c34f0a9569bae693acc1f05f47053ea400f5ec7dafdd743887d080c2da317ab6456a54ac82c1fc7954d32b4bb7e5ad62b5a9f04f7d')

package() {
  cd "${_reponame}-${pkgver}"

  install -Dm 644 via.zsh-theme \
    -t "${pkgdir}/usr/share/oh-my-zsh/custom/themes/${_reponame}/"

  install -Dm 644 functions/* \
    -t "${pkgdir}/usr/share/oh-my-zsh/custom/themes/${_reponame}/functions/"

  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${_reponame}/"
}

