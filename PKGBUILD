# Maintainer: Weslen Nascimento <weslenng@outlook.com>

pkgname=sspl
pkgver=0.3.0
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
  git clone $url
  cd sspl
  go build .
}

package() {
  cd sspl
  rm -rf $HOME/.sspl
  mkdir $HOME/.sspl
  cp bin/debug.keystore $HOME/.sspl/
  cp bin/network_security_config.xml $HOME/.sspl/
  install -Dm755 $pkgname "$pkgdir"/usr/local/bin/$pkgname
}
