# Maintainer: Andrey Vihrov <andrey.vihrov at gmail.com>

pkgname=quake3-edawn
pkgver=1.4.2
pkgrel=1
pkgdesc="A Quake III Arena mod with numerous improvements"
arch=('any')
url="http://edawn-mod.org/"
license=('custom')
depends=('quake3')
source=("http://edawn-mod.org/binaries/edawn-${pkgver}-1.zip")
sha256sums=('359785d41ffb11bed213eeeea532541268b576fe0481834c7ece83e06c2afc72')

package() {
  # Non-modified Quake 3 engines may have problems loading
  # files with unusual extensions
  for f in edawn/maps/*.{add,set}; do
    mv "$f" "$f.cfg"
  done

  mkdir -p "${pkgdir}/opt/quake3"
  cp -a edawn "${pkgdir}/opt/quake3"

  install -D -m 0644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
