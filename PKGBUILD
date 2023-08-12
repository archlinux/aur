# Maintainer: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=zsh-autocomplete
pkgver=23.07.13
pkgrel=1
pkgdesc='IDE-style type-ahead completion for Zsh'
arch=('any')
url='https://github.com/marlonrichert/zsh-autocomplete'
license=('MIT')
provides=("$pkgname")

depends=('zsh')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/marlonrichert/zsh-autocomplete/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('97bd8061b7eb2abb87045ebb00abc2568a9367f296fc27ec3e636fcf07ff8f78')

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
