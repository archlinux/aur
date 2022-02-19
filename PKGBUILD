# Maintainer: Namkhai B. <echo bmFta2hhaS5uM0Bwcm90b25tYWlsLmNvbQo= | base64 -d>
# Contributor:   Daniel Menelkir <menelkir@itroll.org>

pkgname=ananicy-cpp-runit
pkgver=1
pkgrel=5
pkgdesc="Ananicy rewritten in C++ for much lower CPU and memory usage. (runit service)"
url="https://gitlab.com/ananicy-cpp/ananicy-cpp/"
license=(GPLv3)
source=("ananicy-cpp-runit.finish"
        "ananicy-cpp-runit.run"
        "ananicy-cpp-runit.start")
b2sums=('SKIP'
        'SKIP'
        'SKIP')
arch=('any')
depends=('ananicy-cpp-nosystemd' 'runit')
install=ananicy-cpp-runit.install

package() {
  mkdir -p "$pkgdir/etc/runit/sv/ananicy-cpp"
  install -D -m0644 "${srcdir}/ananicy-cpp-runit.finish" "${pkgdir}/etc/runit/sv/ananicy-cpp/finish"
  install -D -m0644 "${srcdir}/ananicy-cpp-runit.run" "${pkgdir}/etc/runit/sv/ananicy-cpp/run"
  install -D -m0644 "${srcdir}/ananicy-cpp-runit.start" "${pkgdir}/etc/runit/sv/ananicy-cpp/start"
}
