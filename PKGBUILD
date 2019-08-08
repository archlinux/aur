# Maintainer: xiretza <xiretza+aur@gmail.com>
pkgname=python-discord
_pkgname=discord.py
pkgver=1.3.4
pkgrel=1
pkgdesc="An API wrapper for Discord written in Python"
arch=(any)
url="https://github.com/Rapptz/discord.py"
license=('MIT')
depends=('python' 'python-websockets' 'python-aiohttp')
optdepends=('python-pynacl: Voice support'
            'libffi: Voice support')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/Rapptz/discord.py/archive/v${pkgver}.tar.gz")
sha512sums=('066881593138448da5a759784ddac882d3ad97aecbece7fafc91d4d667fd3883d748d3bc014c35ee60af86c202495ed3631452c8a642de218a2a28c4ea7538fe')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	python setup.py build
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
