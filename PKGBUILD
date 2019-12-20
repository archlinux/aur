# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>
# Contributor: Franek Madej <franek.madej@gmail.com>
# Completion changes and optdepends by Artemis

pkgname=yadm
pkgver=2.3.0
pkgrel=1
pkgdesc="Yet Another Dotfiles Manager"
arch=('any')
url="https://github.com/TheLocehiliosan/yadm"
license=('GPL3')
depends=('git' 'awk')
optdepends=('gnupg: encrypt/decrypt sensitive files'
            'python-j2cli: use jinja2 templates'
            'python-envtpl: use templates with variables')
provides=('yadm')
conflicts=('yadm-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/TheLocehiliosan/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('421c357a240b5ac4e6b971bb2d33414e9551a337993116bf0ea4f411952aab87')

package() {
  cd $srcdir/$pkgname-$pkgver
  install -D -m 755 yadm $pkgdir/usr/bin/yadm
  install -D -m 644 yadm.1 $pkgdir/usr/share/man/man1/yadm.1
  install -D -m 644 completion/yadm.bash_completion "${pkgdir}/usr/share/bash-completion/completions/yadm"
  install -D -m 644 completion/yadm.zsh_completion "${pkgdir}/usr/share/zsh/site-functions/_yadm"
}
