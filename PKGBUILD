# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Ian Denhardt <ian at zenhack dot net>

pkgname=keyringer
pkgver=0.5.9
pkgrel=1
pkgdesc="Encrypted and distributed secret sharing software"
arch=('any')
url="https://keyringer.fluxo.info/"
license=('GPL3')
depends=('gnupg' 'git')
source=("https://keyringer.fluxo.info/releases/${pkgname}-${pkgver}.tar.bz2"
        "https://keyringer.fluxo.info/releases/${pkgname}-${pkgver}.tar.bz2.asc")
sha256sums=('2312089e815082541cb3fd140cfff4118b1dd89a2080549f0594ffbc08e4a2f7'
            'SKIP')
validpgpkeys=("4FA73DE89ADE75998AC24E97B8C1D523FE7AAA84")

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install

  # apparently keyringer looks for /usr/share/keyringer for some things
  ln -s "/usr/lib/${pkgname}" "${pkgdir}/usr/share/${pkgname}"
}
