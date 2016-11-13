# Maintainer: Christian Rebischke <Chris.Rebischke[at]archlinux[dot]org>
# Contributor: Florian Dejonckheere <florian at floriandejonckheere dot be>
# Contributor:  jyantis <yantis@yantis.net>

_pkgname=powerlevel9k
pkgname=zsh-theme-"${_pkgname}"
pkgver=0.5.0
pkgrel=2
pkgdesc='Powerlevel9k theme for zsh'
arch=('any')
url='https://github.com/bhilburn/powerlevel9k'
license=('custom')
depends=('zsh' 'powerline-fonts')
optdepends=('oh-my-zsh-git: oh-my-zsh integration'
  'prezto-git: Prezto integration'
  'antigen-git: Antigen integration'
  'zpm: ZPM integration'
  'zsh-zim-git: Zim integration'
  'awesome-terminal-fonts: icon package'
  'acpi: battery monitoring'
  'git: status of repository'
  'mercurial: status of repository')
 
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bhilburn/powerlevel9k/archive/v${pkgver}.tar.gz")
sha512sums=('5e2167e20312c97965391592a4621d91678f1f9b8e89374380f38535e87dfa2c02db9bb5ff287c2642c9b9217cc3370444ed6c5fd7d7e3492d7f8bfd1fa02d73')

package(){
  cd "${srcdir}/${_pkgname}-${pkgver}"

  # No license
  # Install Readme as License in case in the future some type of license is
  # added
  install -D -m644 README.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  # Install the theme
  install -D -m644 powerlevel9k.zsh-theme "${pkgdir}/usr/share/zsh-theme-${_pkgname}/${_pkgname}.zsh-theme"

  # Install the utilities
  for FILE in functions/*.zsh; do
    install -D -m644 "${FILE}" "${pkgdir}/usr/share/zsh-theme-${_pkgname}/functions/$(basename ${FILE})"
  done
}

# vim:set et sw=2 ts=2 tw=79:
