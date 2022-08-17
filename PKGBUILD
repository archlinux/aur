# Maintainer: Namkhai B. <echo hc.9mobkrof@em | rev>
# Contributor:   Daniel Menelkir <menelkir@itroll.org>

pkgname=ananicy-cpp-runit
pkgver=1
pkgrel=6
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
  install -D -m0755 "${srcdir}/ananicy-cpp-runit.finish" "${pkgdir}/etc/runit/sv/ananicy-cpp/finish"
  install -D -m0755 "${srcdir}/ananicy-cpp-runit.run" "${pkgdir}/etc/runit/sv/ananicy-cpp/run"
  install -D -m0755 "${srcdir}/ananicy-cpp-runit.start" "${pkgdir}/etc/runit/sv/ananicy-cpp/start"
}
