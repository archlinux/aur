# Maintainer: Alexander 'z33ky' Hirsch <1zeeky@gmail.com>

_lua_version=5.2
_lua_name=hpdf
_git_rev=d8c93345d87a96135739017566d98b02774f558a

pkgname=lua-${_lua_name}
pkgver=2.3.0
pkgrel=1
pkgdesc='Programmatically create PDF files using Lua.'
arch=('any')
url='http://luahpdf.colloquiki.com/'
license=('MIT')
depends=('lua' 'libharu')
source=(${pkgname}-${_git_rev}.tar.gz::"https://github.com/jung-kurt/luahpdf/archive/${_git_rev}.tar.gz")
sha256sums=('6eb8c6392bcc76d85d851004d702f3cbf00f485661706ad64ec7d91d5519a925')

build() {
	cd "${srcdir}/lua${_lua_name}-${_git_rev}"
	LUALIB="-llua" LUAINC="" make
}

package() {
	cd "${srcdir}/lua${_lua_name}-${_git_rev}"
	PREFIX="/usr" DESTDIR="${pkgdir}" MODDIR="/usr/lib/lua/5.3" make install
}
