# Maintainer: Weslen Nascimento <weslenng@outlook.com>

pkgname=sspl
pkgver=1.0.0
pkgrel=1
pkgdesc="Bypass SSL Pinning on Android"
arch=("x86_64")
url="https://github.com/weslenng/sspl"
license=("MIT")
groups=()
depends=("android-apktool" "jdk8-openjdk" "java-runtime-common")
makedepends=("git" "go")
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=()
noextract=()
md5sums=() # autofill using updpkgsums

build() {
  # clone
  git clone $url

  # build
  cd sspl
  go build .
}

package() {
  cd sspl

  # dirs
  mkdir -p $HOME/.android
  mkdir -p $HOME/.sspl

  # network security config
  cp bin/network_security_config.xml $HOME/.sspl/

  # install
  install -Dm755 $pkgname "$pkgdir"/usr/local/bin/$pkgname
}
