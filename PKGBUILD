pkgname=bashrc-aosc
pkgver=1.0
pkgrel=1
pkgdesc="A bashrc AOSC path"
arch=('any')
url='https://github.com/AOSC-Dev/bash-config'
license=('MIT')
depends=('bash')
makedepends=('git')
#install=${pkgname}.install
source=("${pkgname}::git+https://github.com/AOSC-Dev/bash-config.git")
sha256sums=('SKIP'
            'SKTP')

pkgver() {
  cd ${pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
  cd "${srcdir}/${pkgname}"

  mkdir -p "${pkgdir}/usr/share/bashrc-aosc"
  cp -r bashrc.d bashrc "${pkgdir}/usr/share/bashrc-aosc/"
}
