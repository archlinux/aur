# Maintainer: zhzy0077 <zhzy0077@hotmail.com>
pkgname=intuneme-bin
pkgver=0.19.0
pkgrel=1
pkgdesc="Run Microsoft Intune on an immutable Linux host (Binary)"
arch=('x86_64')
url="https://github.com/frostyard/intuneme"
license=('MIT')
depends=('systemd' 'polkit' 'dbus')
provides=('intuneme')
conflicts=('intuneme')
source=("intuneme-$pkgver-linux-amd64.tar.gz::https://github.com/frostyard/intuneme/releases/download/v$pkgver/intuneme_${pkgver}_linux_amd64.tar.gz")
sha256sums=('2236588a8a3e0a6e280a28a814255f630326e1dca539229d85450cb29187ca2d')

package() {
  cd "$srcdir"
  
  # Install binary
  install -Dm755 intuneme "$pkgdir/usr/bin/intuneme"
  
  # Install License
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/intuneme/LICENSE"

  # Install Shell Completions (shipped in the release tarball)
  install -Dm644 completions/intuneme.bash "$pkgdir/usr/share/bash-completion/completions/intuneme"
  install -Dm644 completions/intuneme.zsh "$pkgdir/usr/share/zsh/site-functions/_intuneme"
  install -Dm644 completions/intuneme.fish "$pkgdir/usr/share/fish/vendor_completions.d/intuneme.fish"

  # Install Manpages (shipped in the release tarball)
  install -Dm644 manpages/intuneme.1.gz "$pkgdir/usr/share/man/man1/intuneme.1.gz"
}
