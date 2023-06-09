# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=thunderbird-dav-4-tbsync
_file=1021785
_name=provider_fur_caldav_carddav
pkgver=4.4
pkgrel=1
pkgdesc='Provider for CalDAV & CardDAV Version History'
arch=('any')
url="https://github.com/jobisoft/DAV-4-TbSync"
license=('MPL2')
groups=('office')
depends=(
  'thunderbird>=102.3.3'
  'thunderbird<103'
)
source=("https://addons.thunderbird.net/thunderbird/downloads/file/${_file}/${_name}-${pkgver}-tb.xpi")
noextract=("${_name}-${pkgver}-tb.xpi")
sha512sums=('9695150019ff10fac40a19815ad1e8f4864b7b570e4fd502cf1fce59b83d1c118ccf47deb17a24439ecf2f27a93b2a85389fbb9e3510de7a05fc1c11fbc7fcd0')

package() {
  _extension_id="dav4tbsync@jobisoft.de"
  _extension_dest="${pkgdir}/usr/lib/thunderbird/extensions/${_extension_id}"
  install -Dm644 "${srcdir}/${_name}-${pkgver}-tb.xpi" "${_extension_dest}.xpi"
}
