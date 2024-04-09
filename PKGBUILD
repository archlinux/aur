# Maintainer: TheBill2001 <tuantran1632001 at gmail dot com>

_pkgname=qtcreator-spellchecker-plugin
pkgname=${_pkgname}-bin
pkgver=3.5.0
_qtcreatorver=12.0.0
pkgrel=2
pkgdesc="Spell Checker plugin for the Qt Creator IDE"
groups=('qt')
arch=('x86_64')
url="https://github.com/CJCombrink/SpellChecker-Plugin"
license=('LGPL-3.0-only' 'GPL-3.0-only')
depends=(
    'qtcreator>=12.0.0' 'qtcreator<13.0.0'
    'hunspell'
)
makedepends=(
    'qtcreator-devel>=12.0.0' 'qtcreator-devel<13.0.0'
    'cmake'
)
provides=('qtcreator-spellchecker-plugin')
conflicts=('qtcreator-spellchecker-plugin')
source=("${_pkgname}-$pkgver.tar.gz::${url}/releases/download/v${pkgver}/SpellChecker-Plugin_QtC${_qtcreatorver}_linux_x64.tar.gz")
sha256sums=('2eed168af2e42f495b7482caf00050759e99a3bbec1d542f6223debf83f90ba8')

package() {
    install -D "${srcdir}/lib/qtcreator/plugins/libSpellChecker.so" "${pkgdir}/usr/lib/qtcreator/plugins/libSpellChecker.so"
}
