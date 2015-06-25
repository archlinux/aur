# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>

pkgname=('gittify')

pkgver=1.0.0
pkgrel=1

pkgdesc="Customized bash environment, making git folders more friendly."
url="https://github.com/momeni/gittify"

arch=('any')
license=('GPL3')

depends=('bash' 'git>=1.7.11' 'coreutils' 'grep' 'sed' 'gawk')
install=gittify.install

source=("https://github.com/momeni/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('10d789459e86f110f3f75d7217fb168438c245da68ad7f895535b36caf1fc8f7d53e0478061b312d875e58911121b8e15d4823e73e98b659490f3cdc1a15687f')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -D -m 644 README.md "${pkgdir}/usr/share/gittify/README.md"
  install -D -m 644 homefolder/.gitconfig "${pkgdir}/etc/gittify/gitconfig.base"
  install -D -m 644 homefolder/git.bashrc "${pkgdir}/etc/gittify/git.bashrc"
  install -D -m 755 bin/gittify "${pkgdir}/usr/bin/gittify"
}

