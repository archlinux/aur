# Maintainer: Vlad Petrov <ejiek@mail.ru>
pkgname=nb
pkgver=5.6.1
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
sha512sums=('0009ddfff04688d71183f9f25a55a06b4b75c2c24163f5acb5f638356fd66f54231142092e9b1858c7c121c8cc1b7b6018980df34c49cc1af9f4fee46916ecd5')

package()
 {
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
