# Maintainer: Mateusz Gozdek <mgozdekof@gmail.com>
# Contributor: Eirik Albrigtsen <analsandblaster at gmail dot com>

pkgname=blackbox-vcs
pkgver=2.0.0
pkgrel=1
pkgdesc="Safely store secrets in Git/Mercurial/Subversion"
arch=('any')
url="https://github.com/StackExchange/blackbox"
license=('MIT')
depends=('gnupg' 'bash')
source=("https://github.com/StackExchange/blackbox/archive/v${pkgver}.tar.gz")
sha256sums=('0a8fee39dc46436472528ea3a5743c42ebefc068519545fe6fca57041f42deae')

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
