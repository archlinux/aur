# Maintainer: Matt Moore <matt@mattmoore.io>
_pkgname=h2o
pkgname=h2ogames
pkgver=0.1.0
pkgrel=6
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
sha512sums=("c1b766ddc441a149f8b1a4f1370e793acc333afe5fc02f87319e9813cb36e8c64421b7dda3594bab1d1eb13f720b852ba517c8bf8fecd0bf28cb4fdac757ffc0")
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
