# Maintainer: xiretza <xiretza+aur@gmail.com>
pkgname=python-discord
_pkgname=discord.py
pkgver=1.3.1
pkgrel=1
pkgdesc="An API wrapper for Discord written in Python"
arch=(any)
url="https://github.com/Rapptz/discord.py"
license=('MIT')
depends=('python' 'python-websockets' 'python-aiohttp')
optdepends=('python-pynacl: Voice support'
            'libffi: Voice support')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/Rapptz/discord.py/archive/v${pkgver}.tar.gz")
sha512sums=('ff404b6d8989d7788d8a1e8a9d7873ec4495088578f83762bf63c539c39ea14e896910e3b9457072aa639ac6aa45ee531fc9b0e73dd4e13f5db2948daaf78944')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	python setup.py build
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
