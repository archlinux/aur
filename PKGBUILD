# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=t21dev
_gitname=porter-app
_appname=Porter
pkgname=${_gitname}-bin
pkgdesc="Port Monitor 📈"

pkgver=0.8.1
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('amd64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('glibc' 'libgcc' 'glib2' 'gtk3' 'libsoup3' 'gdk-pixbuf2' 'webkit2gtk-4.1' 'cairo' 'hicolor-icon-theme')

options=('!strip')

source=("LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.deb::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[0]}.deb")
sha256sums=('3e6ec8b6bcef8ed4adeb55701eab79825d1dd5125f8bb0c8395131b32b0aff22')
sha256sums_x86_64=('85eb53d555a5e55e31102b62dfd80a111a53a433df69ed818c5d019486e8cb9e')


package() {
	cd "${pkgdir}"

	tar -xf "${srcdir}/data.tar.gz"

	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
