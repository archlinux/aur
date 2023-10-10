# Maintainer: Dan Johansen <strit@strits.dk>
# Contributor: Recolic K <root@recolic.net>

pkgname=libsdbus-c++0
pkgver=0.8.3
pkgrel=4
pkgdesc="High-level C++ D-Bus library for Linux in modern C++ (library)."
url="https://github.com/Kistler-Group/sdbus-cpp"
license=("GPL2")
arch=("x86_64")
depends=("glibc>=2.14" "gcc-libs>=3.0" "systemd-libs>=243")
makedepends=()
conflicts=("sdbus-cpp")
replaces=("sdbus-cpp")
backup=()
# https://packages.debian.org/bullseye/amd64/libsdbus-c++0/download
source=("source.deb::http://http.us.debian.org/debian/pool/main/s/sdbus-cpp/libsdbus-c++0_${pkgver}-${pkgver}_amd64.deb")
sha256sums=('3c534db269fdf6b3f52b48c0f10ca2065c41473e5de11717368f9d39cc734e89')

package() {
  cd "$srcdir"
  ar x source.deb
  tar xvJf data.tar.xz
  mkdir -p "$pkgdir/usr/lib"
  cp usr/lib/x86_64-linux-gnu/libsdbus-c++.so.0.8.3 "$pkgdir/usr/lib/"
}

