# Maintainer: Dan Johansen <strit@strits.dk>
# Maintainer: Recolic K <root@recolic.net>

pkgname=msalsdk-dbusclient
pkgver=1.0.0
pkgrel=1
pkgdesc="Microsoft Authentication Library cross platform. Dbus client for talking to MSAL broker"
url="https://packages.microsoft.com/ubuntu/20.04/prod/pool/main/m/msalsdk-dbusclient"
license=("GPL2")
arch=("x86_64")
depends=("glibc>=2.14" "gcc-libs>=3.0" "systemd-libs>=243" "libsdbus-c++0" "microsoft-identity-broker>=1.0")
# https://packages.debian.org/bullseye/amd64/libsdbus-c++0/download
source=("source.deb::$url/${pkgname}_${pkgver}_amd64.deb")
sha256sums=('78588d17039d3bf3096f1a0476e70eece76d732fd938e447e37a3c3c33af0b36')
install=x.install

package() {
  cd "$srcdir"
  ar x source.deb
  tar xvzf data.tar.gz
  cp -r "$srcdir/usr" "$pkgdir/"
}


