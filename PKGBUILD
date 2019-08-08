# Maintainer: xiretza <xiretza+aur@gmail.com>
pkgname=python-discord
_pkgname=discord.py
pkgver=1.2.5
pkgrel=1
pkgdesc="An API wrapper for Discord written in Python"
arch=(any)
url="https://github.com/Rapptz/discord.py"
license=('MIT')
depends=('python' 'python-websockets' 'python-aiohttp')
optdepends=('python-pynacl: Voice support'
            'libffi: Voice support')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/Rapptz/discord.py/archive/v${pkgver}.tar.gz")
sha512sums=('03bd8ba2f14f1121c419f96f459ef44116855f6a75f05a21152ec8ce629d06df2dac240d4efd164ef7dc4d4dc0a6d7877029ba29fbc57e1ce5872391f1f1bb9e')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	python setup.py build
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
