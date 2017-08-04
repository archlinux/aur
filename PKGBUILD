# Maintainer: Eirik Albrigtsen <analsandblaster at gmail dot com>

pkgname=blackbox-vcs
pkgver=1.20170611
pkgrel=1
pkgdesc="Safely store secrets in Git/Mercurial/Subversion"
arch=('any')
url="https://github.com/StackExchange/blackbox"
license=('MIT')
depends=('gnupg' 'bash')
source=("https://github.com/StackExchange/blackbox/archive/v${pkgver}.tar.gz")
sha256sums=('c5f75252ab298b6b7b12d9407228a29112df85a228d7ee56a7bc6b0c807da284')

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
