pkgname=pvm-php
pkgver=0.3.1
pkgrel=1
pkgdesc='Homebrew-backed PHP version manager with shim-based shell integration'
arch=('any')
url='https://github.com/AtefR/pvm'
license=('MIT')
depends=('bash' 'curl' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AtefR/pvm/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7d221c3327628a2b4f87dd91e6bae80e8119044c4eba0367b6a84855aee93193')

package() {
  cd "$srcdir/pvm-$pkgver"

  install -Dm755 bin/pvm "$pkgdir/usr/bin/pvm"
  install -Dm755 libexec/pvm-shim "$pkgdir/usr/libexec/pvm-shim"
  install -Dm644 libexec/pvm-brew.sh "$pkgdir/usr/libexec/pvm-brew.sh"
  install -Dm644 libexec/pvm-commands.sh "$pkgdir/usr/libexec/pvm-commands.sh"
  install -Dm644 libexec/pvm-composer.sh "$pkgdir/usr/libexec/pvm-composer.sh"
  install -Dm644 libexec/pvm-core.sh "$pkgdir/usr/libexec/pvm-core.sh"
  install -Dm644 libexec/pvm-extensions.sh "$pkgdir/usr/libexec/pvm-extensions.sh"
  install -Dm644 share/pvm/init.bash "$pkgdir/usr/share/pvm/init.bash"
  install -Dm644 share/pvm/init.fish "$pkgdir/usr/share/pvm/init.fish"
  install -Dm644 share/pvm/init.sh "$pkgdir/usr/share/pvm/init.sh"
  install -Dm644 share/pvm/init.zsh "$pkgdir/usr/share/pvm/init.zsh"
  install -Dm644 README.md "$pkgdir/usr/share/doc/pvm-php/README.md"
  install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/pvm-php/CHANGELOG.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/pvm-php/LICENSE"
}
