# Maintainer: Andrey Vihrov <andrey.vihrov at gmail.com>

pkgname=quake3-edawn
pkgver=1.4.4
pkgrel=1
pkgdesc="A Quake III Arena mod with numerous improvements"
arch=('any')
url="http://edawn-mod.org/"
license=('custom')
depends=('quake3')
source=("http://edawn-mod.org/binaries/edawn-${pkgver}-1.zip")
sha256sums=('31c36d939a95d213974a6d1d17c99b604e6c391fc54184f59b68a942d3a324d5')

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
