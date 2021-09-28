# Maintainer: Terin Stock <terinjokes@gmail.com>

pkgname=topgit
pkgver=0.19.13
pkgrel=1
pkgdesc="A different patch queue manager"
url="https://github.com/mackyle/topgit"
arch=('any')
license=('GPL2')
depends=('gawk' 'bash')
makedepends=()
source=(
  "https://github.com/mackyle/topgit/archive/topgit-${pkgver}.tar.gz"
)
sha256sums=('eaab17c64c95e70acfcc9d4061e7cc4143eb5f6dbe7bc23a5091cb45885a682c')

package() {
  cd "${pkgname}-topgit-${pkgver}" || exit 1
  make prefix=/usr cmddir=/usr/lib/topgit DESTDIR="${pkgdir}" install

  install -D -m644 contrib/tg-completion.bash "${pkgdir}/usr/share/bash-completion/completions/tg"
}
