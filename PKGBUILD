# Maintainer: darkelectron <darkelectron(at)mailfence.com>
# Maintainer: Allddd <allddd (at) proton (dot) me>

_path='3710/1713168009'
pkgname=libreoffice-extension-languagetool
pkgver=6.4
_filename="LanguageTool-${pkgver}.oxt"
pkgrel=2
pkgdesc='An Open Source style and grammar checker (more than 30 languages)'
arch=('any')
url='https://languagetool.org'
license=('LGPL')
install=${pkgname}.install
groups=('libreoffice-extensions')
depends=('libreoffice' 'java-runtime>=8')
source=("${_filename}::https://extensions.libreoffice.org/assets/downloads/${_path}/${_filename}")
noextract=("${_filename}")
sha256sums=('0f1f39ff2438d322f15962f1d30a5c293bb121a7f709c7bbdc1099636b91625e')

package() {
    local _dest="${pkgdir}/usr/lib/libreoffice/share/extensions/languagetool/"
    install -dm755 "${_dest}"
    bsdtar -xf "${_filename}" -C "${_dest}"
    find "${_dest}" \( -type d -exec chmod 755 {} \; \) -o \( -type f -exec chmod 644 {} \; \)
}

# vim: ts=4 sw=4 et:
