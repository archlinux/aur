# Maintainer: Vlad Petrov <ejiek@mail.ru>
pkgname=nb
pkgver=5.7.6
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
sha512sums=('38908c1eb6b7af2552c97323862e63f46cf6b605615d53d9eca5e7194b63a84484880e87ea616fafc0213ed7091848a9fc1864f80a3ffbeb3ac2503fdb37c783')

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
