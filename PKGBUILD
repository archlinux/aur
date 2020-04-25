# Maintainer: Christian Rebischke <chris.rebischke@archlinux.org>
# Contributor: Jeff Henson <jeff@henson.io>
# Contributor: Ron Asimi <ron dot asimi at gmail dot com>

pkgname=zsh-theme-powerlevel10k
pkgver=1.5.0
pkgrel=1
pkgdesc="Powerlevel10k is a theme for Zsh. It emphasizes speed, flexibility and out-of-the-box experience."
arch=('any')
url='https://github.com/romkatv/powerlevel10k'
license=('MIT')
depends=('zsh')
conflicts=('zsh-theme-powerlevel9k')
optdepends=(
  'powerline-fonts: patched fonts for powerline'
  'oh-my-zsh-git: oh-my-zsh integration'
  'prezto-git: Prezto integration'
  'antigen: Antigen integration'
  'zpm: ZPM integration'
  'zsh-zim-git: Zim integration'
  'awesome-terminal-fonts: icon package'
  'acpi: battery monitoring'
  'git: status of repository'
  'mercurial: status of repository'
  'systemd: virtualization detection'
  'openssh: ssh detection'
)
source=("https://github.com/romkatv/powerlevel10k/archive/v${pkgver}.tar.gz")
sha512sums=('c72f42dc96a0e3d6536436a9d5e261a1613f928043e725a5acba441612d9f89e2f37e53df94623a04cd1208b0868ecd416f23542087c67c46b4d4163e994758b')

package()
{
  cd "${srcdir}/powerlevel10k-${pkgver}"

  # Install license
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  # Install the theme
  install -D -m644 powerlevel10k.zsh-theme "${pkgdir}/usr/share/${pkgname}/powerlevel10k.zsh-theme"
  install -D -m644 powerlevel9k.zsh-theme "${pkgdir}/usr/share/${pkgname}/powerlevel9k.zsh-theme"

  # Install the utilities
  install -D -m755 prompt_powerlevel10k_setup "${pkgdir}/usr/share/${pkgname}/prompt_powerlevel10k_setup"
  install -D -m755 prompt_powerlevel9k_setup "${pkgdir}/usr/share/${pkgname}/prompt_powerlevel9k_setup"
  install -d "${pkgdir}/usr/share/${pkgname}/config"
  cp -R config "${pkgdir}/usr/share/${pkgname}/"
  install -d "${pkgdir}/usr/share/${pkgname}/gitstatus/bin"
  cp -R gitstatus "${pkgdir}/usr/share/${pkgname}/"
  cp -R internal "${pkgdir}/usr/share/${pkgname}/"
}
