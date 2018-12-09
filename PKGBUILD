# Maintainer: Andrew Anderson <andersan@tcd.ie>
pkgname=trinnity-optimizer-git
pkgver=0.1
pkgrel=0
pkgdesc="The triNNity DNN optimizer"
arch=('any')
url="https://bitbucket.org/STG-TCD/trinnity-optimizer"
license=('BSD')
groups=()
depends=()
makedepends=('stack')
checkdepends=()
optdepends=('pbqp: PBQP solver backend')
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=("git+https://bitbucket.org/STG-TCD/trinnity-optimizer")
sha512sums=("SKIP")

build() {
  cd ${srcdir}
  stack build
}

package() {
  BUILTBIN=`find ${srcdir}/stack-work/install -iname "trinnity-optimizer"`
  install -ma=rx $BUILTBIN ${pkgdir}/usr/bin
  ${pkgdir}/usr/bin/triNNity-optimizer --bash-completion-script ${pkgdir}/usr/bin/triNNity-optimizer > ${pkgdir}/usr/share/bash-completion/completions/triNNity-optimizer
}
