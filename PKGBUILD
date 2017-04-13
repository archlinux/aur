pkgname=plexrequests
pkgver="1.20.4"
pkgrel=1
pkgdesc="Simple automated way for users to request new content for Plex"
arch=('any')
url="https://github.com/lokenx/plexrequests-meteor"
license=('MIT')
depends=('meteor-js')
optdepends=('couchpotato' 'sickrage' 'sonarr')
install='plexrequests.install'
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lokenx/plexrequests-meteor/archive/v${pkgver}.tar.gz"
        "${pkgname}.service"
        "${pkgname}.install")
sha256sums=('494da3420e8fe786b02e7e81e4f942afa146e963939c8726d5070b7236eb6e08'
            '5e2a1c4da328172e55a9d5591e0b36311e1051c3278deb3929cf5ce9e3dfbb43'
            'f85d5b42add3b480139656964deb837b95e2b9e0a6baba7f65634c94622cfa5f')
package() {
  install -d "${pkgdir}/opt/${pkgname}"
  cp -r "plexrequests-meteor-${pkgver}/." "${pkgdir}/opt/${pkgname}"
  install -Dm644 "plexrequests-meteor-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
