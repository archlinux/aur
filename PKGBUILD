# Maintainer: Vlad Petrov <ejiek@mail.ru>
pkgname=nb
pkgver=5.7.7
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
sha512sums=('cfc102f158cfb986e8a8e327308b7443af08b8097f0d0b6bec59ab03cba40b5d20b7579724fd9b4196402f06d3fb3fc9aba7c86fa77661460c124821d3f1c716')

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
