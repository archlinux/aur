pkgname=phoebe
pkgver=1.0.1
pkgrel=1
pkgdesc="A CLI tool for managing events"
arch=('x86_64')
url="https://github.com/Ap0ll02/PhoebeEvents"
license=("MIT")
depends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Ap0ll02/PhoebeEvents/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('652c24f002060390848ed249b3cf1ad7ec22752e3dd6387a9653fe8e523e7d79')


build() {
  cd "$srcdir/${pkgname}events-$pkgver"
  go build -o pb
}

package() {
  cd "$srcdir/${pkgname}events-$pkgver"
  # Create ~/.local/bin if it doesn't exist 
  install -Dm755 pb "$pkgdir/usr/bin/pb"  

  echo "Phoebe CLI has been installed. Please note you may need to add to path if pb isnt working, or decide how to handle this on your own:";
  echo "Needed Path: /usr/bin";
  echo "For simplicity, one can run: export PATH=/usr/bin for bash/zsh";
  echo "For fish: set -gx PATH /usr/bin";
  echo "And source afterwards. source ~/.zshrc | source ~/.bashrc | source ~/.config/fish/config.fish"
}
