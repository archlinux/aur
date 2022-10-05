# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=dero-bin
_pkgname=dero
pkgver=3.5.1.r113
_release=113
pkgrel=1
pkgdesc='DERO: cryptonote currency daemon and CLI wallet'
url='https://github.com/deroproject/derohe'
arch=('x86_64')
license=('custom')
source=("$_pkgname-$pkgver-amd64.tar.gz::$url/releases/download/Release${_release}/dero_linux_amd64.tar.gz"
        "https://raw.githubusercontent.com/deroproject/derohe/main/LICENSE")
sha512sums=('4276939a3ac3782f1f6396d4cb029a7fe6d7812571dcef6e7954a28d93f2a194b789a28b20bfbb53941690338011f3076ebea803ad162cb1e92a1b2b9727a711'
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
