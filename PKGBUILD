# Maintainer: Mateus Felipe Gonçalves (mateusfg7) <mateusfelipefg77@gmail.com>
# Contributor: Bachitter Chahal <bachitterch@pm.me>

pkgname=pscale
_pkgname=pscale
pkgver=0.126.0
pkgrel=0
pkgdesc='PlanetScale CLI client package for Arch'
arch=('x86_64')
url='https://github.com/planetscale/cli'
license=('Apache')
provides=('pscale')
conflicts=('pscale' 'pscale-git' 'pscale-bin' 'pscale-cli')
source=("https://github.com/planetscale/cli/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")

package() {
  install -Dm755 pscale ${pkgdir}/usr/bin/pscale
  
  if [ -d "/usr/share/fish/vendor_completions.d/" ]; then
    install -Dm755 completions/pscale.fish /usr/share/fish/vendor_completions.d/pscale.fish
  fi

  if [ -d "/usr/share/bash-completion/completions/" ]; then
    install -Dm755 completions/pscale.bash /usr/share/bash-completion/completions/_pscale
  fi
  
  if [ -d "/usr/share/zsh/site-functions/" ]; then
   install -Dm755 completions/pscale.zsh /usr/share/zsh/site-functions/_pscale
  fi
}
