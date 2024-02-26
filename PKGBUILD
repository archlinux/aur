# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=dero-bin
_pkgname=dero
pkgver=3.5.1.r140
_release=140
pkgrel=1
pkgdesc='DERO: cryptonote currency daemon and CLI wallet'
url='https://github.com/deroproject/derohe'
arch=('x86_64')
license=('custom')
source=("$_pkgname-$pkgver-amd64.tar.gz::$url/releases/download/Release${_release}/dero_linux_amd64.tar.gz"
        "https://raw.githubusercontent.com/deroproject/derohe/main/LICENSE")
sha512sums=('d9e89697fdba5661dc4dfb3eced4ad5bcce3168387190109a77b3b153d7f5079e4060ff146f96af5e9db89b4d13742aa3704e6cedac6f20de83bc6a5d40bfd46'
            '3e7aaf3175a6ecef2dd6998e830400dc0cbad06c27663533236b9c65ee7dbd6bbcd8034834fa7d2c50362ae451d0e4f8fffffac7027a4f408cec92f7189206a1')

package() {
  install -Dm644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

  # install required binaries
  install -Dm755 "${srcdir}/dero_linux_amd64/derod-linux-amd64" "$pkgdir/usr/share/$_pkgname/derod-linux-amd64"
  install -Dm755 "${srcdir}/dero_linux_amd64/dero-miner-linux-amd64" "$pkgdir/usr/share/$_pkgname/dero-miner-linux-amd64"
  install -Dm755 "${srcdir}/dero_linux_amd64/dero-wallet-cli-linux-amd64" "$pkgdir/usr/share/$_pkgname/dero-wallet-cli-linux-amd64"
  install -Dm755 "${srcdir}/dero_linux_amd64/explorer-linux-amd64" "$pkgdir/usr/share/$_pkgname/explorer-linux-amd64"
  install -Dm755 "${srcdir}/dero_linux_amd64/simulator-linux-amd64" "$pkgdir/usr/share/$_pkgname/simulator-linux-amd64"

  install -Dm644 "${srcdir}/dero_linux_amd64/Start.md" "$pkgdir/usr/share/$_pkgname/Start.md"

  # create symlinks
  install -d "${pkgdir}/usr/bin"
  ln -s /usr/share/${_pkgname}/derod-linux-amd64 "${pkgdir}/usr/bin"
  ln -s /usr/share/${_pkgname}/dero-miner-linux-amd64 "${pkgdir}/usr/bin"
  ln -s /usr/share/${_pkgname}/dero-wallet-cli-linux-amd64 "${pkgdir}/usr/bin"
  ln -s /usr/share/${_pkgname}/explorer-linux-amd64 "${pkgdir}/usr/bin"
  ln -s /usr/share/${_pkgname}/simulator-linux-amd64 "${pkgdir}/usr/bin"
}
