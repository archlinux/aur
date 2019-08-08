# Maintainer: xiretza <xiretza+aur@gmail.com>
pkgname=python-discord
_pkgname=discord.py
pkgver=1.3.3
pkgrel=1
pkgdesc="An API wrapper for Discord written in Python"
arch=(any)
url="https://github.com/Rapptz/discord.py"
license=('MIT')
depends=('python' 'python-websockets' 'python-aiohttp')
optdepends=('python-pynacl: Voice support'
            'libffi: Voice support')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/Rapptz/discord.py/archive/v${pkgver}.tar.gz")
sha512sums=('a7a68086d2eeeb098a9bb310d6f3ed700cfe687853e08911ceaf12c5bc1c0b8b5011dd2e7443f6621304c66ff5f6ae1e4e554530c3ccfadcae9028ba5bfb6ddb')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	python setup.py build
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
