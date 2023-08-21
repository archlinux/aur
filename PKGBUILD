# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=thunderbird-dav-4-tbsync
_file=1023905
_name=provider_fur_caldav_carddav
pkgver=4.7
pkgrel=1
pkgdesc='Provider for CalDAV & CardDAV Version History'
arch=('any')
url="https://github.com/jobisoft/DAV-4-TbSync"
license=('MPL2')
groups=('office')
depends=(
  'thunderbird>=102.3.3'
  'thunderbird<116'
)
source=("https://addons.thunderbird.net/thunderbird/downloads/file/${_file}/${_name}-${pkgver}-tb.xpi")
noextract=("${_name}-${pkgver}-tb.xpi")
sha512sums=('2a777c6a6ab16e9460c46acee6e0efeee7b605aeae09a9038e4648792815bb4fb6129c643ec230eb6d7fe6defbc95d1fadfe70d543f0ea2b589437d9b09591bf')

package() {
  _extension_id="dav4tbsync@jobisoft.de"
  _extension_dest="${pkgdir}/usr/lib/thunderbird/extensions/${_extension_id}"
  install -Dm644 "${srcdir}/${_name}-${pkgver}-tb.xpi" "${_extension_dest}.xpi"
}
