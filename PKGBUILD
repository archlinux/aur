# Maintainer: erdii <me@erdii.engineering

pkgname=magic-trace-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="magic-trace collects and displays high-resolution traces of what a process is doing"
arch=("x86_64")
url="https://github.com/janestreet/magic-trace"
license=("MIT")
provides=("magic-trace")
conflicts=("magic-trace")
depends=("perf")
source=("$pkgname-$pkgver.deb::https://github.com/janestreet/magic-trace/releases/download/v${pkgver}/magic-trace_${pkgver}+deb20.04_amd64.deb")
sha256sums=('72c2f8c11033b2894eaedde38e7c2c8916abcda1cf3b22135172056909a6a742')

prepare() {
  tar -xaf "${srcdir}/data.tar.xz" -C "${srcdir}"
}

package() {
  install -Dm755 "${srcdir}/bin/magic-trace" "${pkgdir}/usr/bin/magic-trace"
  install -Dm644 "${srcdir}/doc/magic-trace/LICENSE.md" "$pkgdir/usr/share/licenses/magic-trace/LICENSE"
  install -Dm644 "${srcdir}/doc/magic-trace/README.md" "$pkgdir/usr/share/doc/magic-trace/README.md"
  install -Dm644 "${srcdir}/usr/share/doc/magic-trace/changelog.gz" "$pkgdir/usr/share/doc/magic-trace/changelog.gz"
}
