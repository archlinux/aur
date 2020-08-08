# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>

pkgname=gittify

pkgver=1.2.0
pkgrel=1

pkgdesc="A customized bash environment to make git folders more friendly."
url="https://github.com/momeni/gittify"

arch=('any')
license=('GPL3')

depends=('bash' 'git>=1.7.11' 'coreutils' 'grep' 'sed' 'gawk')
install=gittify.install

source=("https://github.com/momeni/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('1a06ad1e5714d9d8092917ea93759003b4f29e8e6cc6457cd1c9c7b1bde8ffe24431e079269ab03765008a489f009ed673616054945b45226ea9a6b0d95c4c75')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -D -m 644 README.md "${pkgdir}/usr/share/gittify/README.md"
  install -D -m 644 homefolder/.gitconfig "${pkgdir}/etc/gittify/gitconfig.base"
  install -D -m 644 homefolder/git.bashrc "${pkgdir}/etc/gittify/git.bashrc"
  install -D -m 755 bin/gittify "${pkgdir}/usr/bin/gittify"
}

