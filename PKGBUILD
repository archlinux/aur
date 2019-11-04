# Maintainer: Terin Stock <terinjokes@gmail.com>

pkgname=topgit
pkgver=0.19.12
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
sha256sums=('104eaf5b33bdc738a63603c4a661aab33fc59a5b8e3bb3bc58af7e4fc2d031da')

package() {
  cd "${pkgname}-topgit-${pkgver}" || exit 1
  make prefix=/usr cmddir=/usr/lib/topgit DESTDIR="${pkgdir}" install

  install -D -m644 contrib/tg-completion.bash "${pkgdir}/usr/share/bash-completion/completions/tg"
}
