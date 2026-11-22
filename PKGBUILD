# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=ario-tui-bin
pkgver=0.2.4
pkgrel=1
pkgdesc="A terminal download manager powered by aria2, with scheduled queues, daemon, batch clipboard imports"
arch=('x86_64')
url="https://github.com/peymanAzad/ario"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/ario-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('00ddf56dd9444da6d4a536fdd51a43d1faf576e9ba274c4837785982523f2b7f')

package() {
  cd "ario-x86_64-unknown-linux-gnu"
  install -Dm755 "ario_daemon" "${pkgdir}/usr/bin/ario_daemon"
  install -Dm755 "ario" "${pkgdir}/usr/bin/ario"
  install -Dm644 "man/ario.1" -t "${pkgdir}/usr/share/man/man1"
  install -Dm644 "man/ario_daemon.1" -t "${pkgdir}/usr/share/man/man1"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
