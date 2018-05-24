# Maintainer: Pablo Arias <pabloariasal@gmail.com>
# Contributor: John Jenkins <twodopeshaggy@gmail.com>

pkgname=googler
pkgver=3.5
pkgrel=1
pkgdesc="Google from the command-line"
arch=('any')
url="https://github.com/jarun/googler"
license=('GPL3')
depends=('python')
conflicts=('googler-git')
source=("https://github.com/jarun/googler/archive/v$pkgver.tar.gz")
sha256sums=('55ff07648257f5d2d642d1f5d6bd682e6aa32605755d4040dac4ef787257cbea')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  make disable-self-upgrade > /dev/null
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 googler "${pkgdir}/usr/bin/googler"
  install -Dm644 googler.1 "${pkgdir}/usr/share/man/man1/googler.1"
  install -Dm644 auto-completion/fish/googler.fish "${pkgdir}/usr/share/fish/vendor_completions.d/googler.fish"
  install -Dm644 auto-completion/bash/googler-completion.bash "${pkgdir}/etc/bash_completion.d/googler"
  install -Dm644 auto-completion/zsh/_googler "${pkgdir}/usr/share/zsh/site-functions/_googler"
}
