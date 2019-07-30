# Maintainer: trougnouf (Benoit Brummer) <trougnouf at gmail dot com>

# to activate the plugin, run:
# $ echo 'require "contrib/enfuse_pro"' >> ~/.config/darktable/luarc

_name='enfuse_pro'
pkgname="darktable-plugin-${_name}"
pkgver=2.1.6
pkgrel=1
pkgdesc='Enfuse_pro LUA plugin for darktable'
url='https://www.multimedia4linux.de/'
depends=('darktable' 'enblend-enfuse' 'perl-image-exiftool' 'hugin')
makedepends=()
license=('GPL3')
arch=('x86_64')
source=("${url}images/darktable/plugins/${_name}-${pkgver}.tar")
sha256sums=('e8b68dcfde7db8332423a47c0138c7f17b2cf7e74c4382e27a087318dc6ee4d3')

package() {
	mkdir -p "${pkgdir}/usr/share/darktable/lua/contrib/"
	mkdir -p "${pkgdir}/usr/share/darktable/lua/locale/"
	cp "${srcdir}/${_name}-${pkgver}/${_name}.lua" "${pkgdir}/usr/share/darktable/lua/contrib/"
	cp -r "${srcdir}/${_name}-${pkgver}/de_DE/" "${pkgdir}/usr/share/darktable/lua/locale/"
	cp -r "${srcdir}/${_name}-${pkgver}/fr_FR/" "${pkgdir}/usr/share/darktable/lua/locale/"
}

