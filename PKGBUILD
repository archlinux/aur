# Maintainer: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=zsh-autocomplete
pkgver=24.09.04
pkgrel=1
pkgdesc='IDE-style type-ahead completion for Zsh'
arch=('any')
url='https://github.com/marlonrichert/zsh-autocomplete'
license=('MIT')
provides=("$pkgname")

depends=('zsh')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/marlonrichert/zsh-autocomplete/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('bfcaa4b2d3add07c6b3d5a587d9ed743e091f1bb8e818cbd157895376edf2e87')

package() {
	_srcdir=${srcdir}/${pkgname}-${pkgver}
	_plugindir=${pkgdir}/usr/share/zsh/plugins
	_licdir=${pkgdir}/usr/share/licenses/${pkgname}

	install -dm0755 ${_plugindir}/${pkgname}
	cp -r ${_srcdir}/zsh-autocomplete.plugin.zsh \
		${_srcdir}/Completions \
		${_srcdir}/Functions \
		${_plugindir}/${pkgname}

	install -dm755 ${_licdir}
	install -m0644 ${_srcdir}/LICENSE ${_licdir}
}
