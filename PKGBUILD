# Maintainer: Allddd <allddd (at) proton (dot) me>
_path='3710/1697301266'
pkgname=libreoffice-extension-languagetool
pkgver=6.3
_filename="LanguageTool-${pkgver}.oxt"
pkgrel=1
pkgdesc='An Open Source style and grammar checker (more than 30 languages)'
arch=('any')
url='https://languagetool.org'
license=('LGPL')
groups=('libreoffice-extensions')
depends=('libreoffice' 'java-runtime>=8')
source=("${_filename}::https://extensions.libreoffice.org/assets/downloads/${_path}/${_filename}")
noextract=("${_filename}")
sha256sums=('bf1d251d38b3efbcdc742ba4bbabb234151d9b59bb98bdcf4cd512115db604e7')

package() {
    local _dest="${pkgdir}/usr/lib/libreoffice/share/extensions/languagetool/"
    install -dm755 "${_dest}"
    bsdtar -xf "${_filename}" -C "${_dest}"
    find "${_dest}" \( -type d -exec chmod 755 {} \; \) -o \( -type f -exec chmod 644 {} \; \)
}

# vim: ts=4 sw=4 et:
