# Maintainer: Sergey Khobta <hxss@ya.ru>

pipname=pyvips
pkgname=python-$pipname
pkgver=2.1.13
pkgrel=1
pkgdesc="binding for the libvips image processing library, API mode"
arch=(any)
url="https://github.com/libvips/pyvips"
license=(MIT)
depends=("libvips" "python" "python-cffi" "python-pkgconfig")
makedepends=("python-pip" "curl" "jq")

pkgver() {
	curl -s https://pypi.org/pypi/$pipname/json | jq -r .info.version
}

package() {
	pip install $pipname \
		--root=$pkgdir \
		--no-user \
		--no-deps \
		--ignore-installed \
		--quiet
}
