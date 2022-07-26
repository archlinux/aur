# Maintainer: Mateusz Gozdek <mgozdekof@gmail.com>
# Contributor: Eirik Albrigtsen <analsandblaster at gmail dot com>

pkgname=blackbox-vcs
pkgver=1.20220610
pkgrel=1
epoch=1
pkgdesc="Safely store secrets in Git/Mercurial/Subversion"
arch=('any')
url="https://github.com/StackExchange/blackbox"
license=('MIT')
depends=('gnupg' 'bash')
source=("https://github.com/StackExchange/blackbox/archive/v${pkgver}.tar.gz")
sha256sums=('f1efcca6680159f244eb44fdb78e92b521760b875fa5a36e4c433b93ed0f87c1')

package() {
  cd "${srcdir}/blackbox-${pkgver}"

  # Copy bin files to /usr/bin
  install -d "${pkgdir}/usr/bin"
  for f in `find bin -type f -iname "*" ! -iname "Makefile"`; do
    cp -a "$f" "${pkgdir}/usr/bin/"
  done

  # License
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
