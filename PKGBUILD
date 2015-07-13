# Maintainer : Rob McCathie aka korrode <archaur at rmcc dot com dot au>
# Contributor: Atilla ÖNTAŞ <tarakbumba@gmail.com>
# Contributor: Mitchell Nemitz <mitchell.nemitz@gmail.com>
# Contributor: sebcactus <sebcactus@gmail.com>

pkgname=xdg-su
pkgver=1.2.3
pkgrel=1
pkgdesc="Run a program as root with the most environment appropriate available graphical authentication agent"
arch=('any')
url="https://github.com/tarakbumba/xdg-su"
license=('MIT')
depends=('sh')
makedepends=('links' 'xmlto' 'docbook-xsl')
source=("https://github.com/tarakbumba/${pkgname}/archive/${pkgname}-${pkgver}.tar.gz")
sha1sums=('e92fd399b39f7b38d7bbfc7b834c78e551b2eee5')
 
build() {
  cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}
 
package() {
  cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
