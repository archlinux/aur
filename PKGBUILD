# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>
# Contributor: Franek Madej <franek.madej@gmail.com>
# Completion changes and optdepends by Artemis

pkgname=yadm
pkgver=2.0.0
pkgrel=1
pkgdesc="Yet Another Dotfiles Manager"
arch=('any')
url="https://github.com/TheLocehiliosan/yadm"
license=('GPL3')
optdepends=('gnupg: encrypt/decrypt sensitive files'
            'python-envtpl: use templates with variables')
provides=('yadm')
conflicts=('yadm-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/TheLocehiliosan/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('6359debdd9a6154709d084f478c000e572b3d8d50c2abe6525534899a5c2eb16')

package() {
  cd $srcdir/$pkgname-$pkgver
  install -D -m 755 yadm $pkgdir/usr/bin/yadm
  install -D -m 644 yadm.1 $pkgdir/usr/share/man/man1/yadm.1
  install -D -m 644 completion/yadm.bash_completion "${pkgdir}/usr/share/bash-completion/completions/yadm"
  install -D -m 644 completion/yadm.zsh_completion "${pkgdir}/usr/share/zsh/site-functions/_yadm"
}
