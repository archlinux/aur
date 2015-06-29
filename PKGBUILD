# Maintainer: Stefan Tatschner <stefan@sevenbyte.org>

pkgname=prezto-prompt-rumpelsepp-git
pkgver=r7.6b08a94
pkgrel=1
pkgdesc="My personal prezto theme"
arch=('any')
url='https://gitlab.sevenbyte.org/rumpelsepp/prezto-prompt-rumpelsepp'
license=('MIT')
depends=('prezto-git')
provides=(prompt-rumpelsepp-setup)
conflicts=(prompt-rumpelsepp-setup)
source=("${pkgname}::git+https://gitlab.sevenbyte.org/rumpelsepp/prezto-prompt-rumpelsepp.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  #git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package(){
  cd "$srcdir/$pkgname"
  mkdir -p ${pkgdir}/usr/lib/prezto/modules/prompt/functions/
  cp -ra "$srcdir/$pkgname"/prompt_rumpelsepp_setup ${pkgdir}/usr/lib/prezto/modules/prompt/functions/
}
