# Maintainer: Vlad Petrov <ejiek@mail.ru>
pkgname=nb
pkgver=5.7.8
pkgrel=1
pkgdesc="A command line note-taking, bookmarking, archiving, and knowledge base application"
arch=('any')
url="https://github.com/xwmx/${pkgname}"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
license=('AGPL3')
depends=('bash' 'git')
optdepends=('bat' 'pandoc' 'ripgrep' 'w3m' 'tig')
provides=("$pkgname")
conflicts=("$pkgname")
sha512sums=('d4102012f67cdee8d1e60a29fd42078df3d4f095fb34564ea70563894e5d975e040819ea43abc048dac8596cc03c8a251fc15c6d4620fe3370bc145e97c6660f')

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # setup completions
  install -dm 755 "${pkgdir}/usr/share/bash-completion/completions" \
                  "${pkgdir}/usr/share/zsh/site-functions" \

  install -D -m644 etc/nb-completion.bash "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -D -m644 etc/nb-completion.zsh "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
}

# vim:set ts=2 sw=2 et:
