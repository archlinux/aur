# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Ian Denhardt <ian at zenhack dot net>

pkgname=keyringer
pkgver=0.6.0
pkgrel=1
pkgdesc="Encrypted and distributed secret sharing software"
arch=('any')
url="https://0xacab.org/rhatto/keyringer"
license=('GPL3')
depends=('gnupg' 'git')
source=("https://keyringer.fluxo.info/releases/${pkgname}-${pkgver}.tar.bz2"
        "https://keyringer.fluxo.info/releases/${pkgname}-${pkgver}.tar.bz2.asc")
sha256sums=('99969a99d68918d832bbc16202b5a4d2b6b83abb1306b07a64662e3def2037a9'
            'SKIP')
validpgpkeys=("4FA73DE89ADE75998AC24E97B8C1D523FE7AAA84")

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install

  # apparently keyringer looks for /usr/share/keyringer for some things
  ln -s "/usr/lib/${pkgname}" "${pkgdir}/usr/share/${pkgname}"
}
