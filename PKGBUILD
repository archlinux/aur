# Maintainer: Tom Wadley <tom@tomwadley.net>

pkgname=nvm
pkgver=0.25.4
pkgrel=1
pkgdesc="Simple bash script to manage multiple active node.js versions"
url="https://github.com/creationix/nvm"
arch=('any')
license=('MIT')
optdepends=('bash: bash completion')
install="${pkgname}.install"
source=("https://github.com/creationix/nvm/archive/v${pkgver}.zip"
        "init-nvm.sh")
md5sums=('6cce02443f46df69fe5e35f1d7fe7a33'
         '359e7cff11f9053a1d380272591d29f3')

build() {
  cd "${pkgname}-${pkgver}"
}

package() {
  cd "${srcdir}"

  # convenience script
  install -Dm644 init-nvm.sh "$pkgdir/usr/share/${pkgname}/init-nvm.sh"

  cd "${pkgname}-${pkgver}"

  # nvm.sh
  install -Dm644 nvm.sh "$pkgdir/usr/share/$pkgname/nvm.sh"

  # bash completion
  install -Dm644 bash_completion "$pkgdir/usr/share/$pkgname/bash_completion"

  # license
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}

# vim:set ts=2 sw=2 et:
