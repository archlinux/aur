# Maintainer: Matt Moore <matt@mattmoore.io>
_pkgname=h2o
pkgname=h2ogames
pkgver=0.1.0
pkgrel=5
epoch=
pkgdesc="Game management client for h2o games."
arch=("x86_64")
url="https://github.com/mattmoore/h2o"
license=('Apache-2.0')
groups=()
depends=(
  'xz'
  'glibc'
  'gcc-libs'
)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/mattmoore/h2o/releases/download/v0.1.0/$_pkgname-$pkgver.tar.xz")
sha512sums=("bc8a8206d143f236164fc75b2a99c9ecdd0daae3bc1a67c80968df1c57e32174a4410a98ed64acfa790566d6998658e8e29227603179e0acbcf5b22f503e2974")
validpgpkeys=()

package() {
  ## Libraries ##
  mkdir -p "${pkgdir}/usr/lib"
  cp libh2o.rlib "${pkgdir}/usr/lib/"
  cp libh2o.so "${pkgdir}/usr/lib/"
  cp libh2o.a "${pkgdir}/usr/lib/"


  ## CLI ##
  mkdir -p "${pkgdir}/usr/bin"
  cp h2o "${pkgdir}/usr/bin/"


  ## Shell completions ##

  # zsh
  mkdir -p "${pkgdir}/usr/share/zsh/site-functions"
  cp _h2o "${pkgdir}/usr/share/zsh/site-functions/"

  #bash
  mkdir -p "${pkgdir}/usr/share/bash-completion/completions"
  cp h2o.bash "${pkgdir}/usr/share/bash-completion/completions/"
}
