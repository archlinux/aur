# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>
# Contributor: Franek Madej <franek.madej@gmail.com>
# Completion changes and optdepends by Artemis

pkgname=yadm
pkgver=3.0.0
pkgrel=2
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
sha256sums=('af968c815817e9de85b60dc9c9a7e6159ed34e4f91ea78cadbcd6c73a0301c06')

package() {
  cd $srcdir/$pkgname-$pkgver
  install -D -m 755 yadm $pkgdir/usr/bin/yadm
  install -D -m 644 yadm.1 $pkgdir/usr/share/man/man1/yadm.1
  install -D -m 644 completion/bash/yadm "${pkgdir}/usr/share/bash-completion/completions/yadm"
  install -D -m 644 completion/zsh/_yadm "${pkgdir}/usr/share/zsh/site-functions/_yadm"
  install -D -m 644 completion/fish/yadm.fish "${pkgdir}/usr/share/fish/vendor_completions.d/yadm.fish"
}
