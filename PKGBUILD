# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>
# Contributor: Franek Madej <franek.madej@gmail.com>
# Completion changes and optdepends by Artemis

pkgname=yadm
pkgver=3.0.2
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
sha256sums=('724a8b61b09b70f5952cf14fd1786617bf88243a276b2d93dd7306feab13983c')

package() {
  cd $srcdir/$pkgname-$pkgver
  install -D -m 755 yadm $pkgdir/usr/bin/yadm
  install -D -m 644 yadm.1 $pkgdir/usr/share/man/man1/yadm.1
  install -D -m 644 completion/bash/yadm "${pkgdir}/usr/share/bash-completion/completions/yadm"
  install -D -m 644 completion/zsh/_yadm "${pkgdir}/usr/share/zsh/site-functions/_yadm"
  install -D -m 644 completion/fish/yadm.fish "${pkgdir}/usr/share/fish/vendor_completions.d/yadm.fish"
}
