# Maintainer: Arvedui <arvedui@posteo.de>
# Contributor: Yauheni Kirylau <actionless.loveless@gmail.com>

pkgname='pass-extension-tail'
pkgver=1.2.0
pkgrel=1
pkgdesc='A pass extension to avoid printing the password to the console .'
arch=('any')
url='https://github.com/palortoff/pass-extension-tail'
license=('GPL3')
depends=('pass')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/palortoff/pass-extension-tail/archive/v${pkgver}.tar.gz)
sha512sums=('4ec8ecf64dd8142453066ad07d7743bb03f2040ea2f0c5a9b3e6a5bfdd5318445b0d90509a26324d9095bf7f09cd40927244681dc3bbc352af40a8e5f7a8e0b6')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}/" install

  mkdir -p "${pkgdir}"/usr/share/bash-completion/completions
  mv "${pkgdir}"/{etc/bash_completion.d/pass-tail,usr/share/bash-completion/completions/}
  rm -r "${pkgdir}"/etc
}
