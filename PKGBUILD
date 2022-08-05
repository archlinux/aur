# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=dero-bin
_pkgname=dero
pkgver=r96
pkgrel=1
pkgdesc='DERO: cryptonote currency daemon and CLI wallet'
url='https://github.com/deroproject/derohe'
arch=('x86_64')
license=('custom')
source=("dero-$pkgver-amd64.tar.gz::$url/releases/download/Release96/dero_linux_amd64.tar.gz"
        "https://raw.githubusercontent.com/deroproject/derohe/main/LICENSE")
sha512sums=('288ec9af585d3cfb5c55b0a13eeed14f66a5551f6ed893cb4a214dc88f5336143a44367034b0c3c7bf85240f5b8ef450dcb376e1cb857546776261f6aa30f101'
            '3e7aaf3175a6ecef2dd6998e830400dc0cbad06c27663533236b9c65ee7dbd6bbcd8034834fa7d2c50362ae451d0e4f8fffffac7027a4f408cec92f7189206a1')

package() {
  install -Dm644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

  # install required binaries
  install -Dm755 "${srcdir}/dero_linux_amd64/derod-linux-amd64" "$pkgdir/opt/$_pkgname/derod-linux-amd64"
  install -Dm755 "${srcdir}/dero_linux_amd64/dero-miner-linux-amd64" "$pkgdir/opt/$_pkgname/dero-miner-linux-amd64"
  install -Dm755 "${srcdir}/dero_linux_amd64/dero-wallet-cli-linux-amd64" "$pkgdir/opt/$_pkgname/dero-wallet-cli-linux-amd64"
  install -Dm755 "${srcdir}/dero_linux_amd64/explorer-linux-amd64" "$pkgdir/opt/$_pkgname/explorer-linux-amd64"
  install -Dm755 "${srcdir}/dero_linux_amd64/simulator-linux-amd64" "$pkgdir/opt/$_pkgname/simulator-linux-amd64"

  install -Dm644 "${srcdir}/dero_linux_amd64/Start.md" "$pkgdir/opt/$_pkgname/Start.md"

  # create symlinks
  install -d "${pkgdir}/usr/bin"
  ln -s /opt/${_pkgname}/derod-linux-amd64 "${pkgdir}/usr/bin"
  ln -s /opt/${_pkgname}/dero-miner-linux-amd64 "${pkgdir}/usr/bin"
  ln -s /opt/${_pkgname}/dero-wallet-cli-linux-amd64 "${pkgdir}/usr/bin"
  ln -s /opt/${_pkgname}/explorer-linux-amd64 "${pkgdir}/usr/bin"
  ln -s /opt/${_pkgname}/simulator-linux-amd64 "${pkgdir}/usr/bin"
}
