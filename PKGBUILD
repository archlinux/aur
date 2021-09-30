# Maintainer: Strykar <strykar@hotmail.com>

pkgname=go-livepeer-bin
_pkgname=go-livepeer
pkgver=0.5.21
pkgrel=1
pkgdesc='Official Go binaries of the Livepeer protocol'
arch=('x86_64')
url='https://github.com/livepeer/go-livepeer'
license=('MIT')
conflicts=('go-livepeer-git')
source=("https://github.com/livepeer/${_pkgname}/releases/download/v${pkgver}/livepeer-linux-amd64.tar.gz"
  "livepeer.service")
sha256sums=('aa966e0af5599faf04d1c9334da36f59e3f6007ca23fc0f21c7c2379b998f0e4'
            '19f2c69e7f84e32236fe7f46a9b969cbe2f936651a1a50b818279fdd7299da3b')
package() {
  install -Dm 755 "${srcdir}/livepeer-linux-amd64/livepeer" "$pkgdir/usr/bin/livepeer"
  install -Dm 755 "${srcdir}/livepeer-linux-amd64/livepeer_bench" "$pkgdir/usr/bin/livepeer_bench"
  install -Dm 755 "${srcdir}/livepeer-linux-amd64/livepeer_cli" "$pkgdir/usr/bin/livepeer_cli"
  install -Dm 755 "${srcdir}/livepeer-linux-amd64/livepeer_router" "$pkgdir/usr/bin/livepeer_router"
  install -Dm 644 "$srcdir/livepeer.service" -t "${pkgdir}/usr/lib/systemd/system"
}
