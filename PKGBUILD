# Maintainer: Antoni Kepinski <a[at]kepinski[dot]me>
pkgname=cash-cli
pkgver=1.0.0
pkgrel=1
pkgdesc="Convert 170 Currency Rates using your terminal!"
url="https://github.com/xxczaki/cash-cli/"
arch=('i686' 'x86_64')
license=('MIT')
makedepends=('git' 'nodejs')
_gitroot="git://github.com/xxczaki/cash-cli.git"
_gitname="cash-cli"

package() {
	cd "${PKGMK_SOURCE_DIR}"

	if cd "${pkgname}"; then
		git fetch -q
		git reset --hard origin/master
	else
		git clone ${_gitroot} ${_gitname}
		cd "${pkgname}"
	fi

	npm install --global
}
