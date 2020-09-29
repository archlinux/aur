# Maintainer: xiretza <xiretza+aur@gmail.com>
pkgname=python-discord
_pkgname=discord.py
pkgver=1.5.0
pkgrel=1
pkgdesc="An API wrapper for Discord written in Python"
arch=(any)
url="https://github.com/Rapptz/discord.py"
license=('MIT')
depends=('python' 'python-aiohttp')
optdepends=('python-pynacl: Voice support'
            'libffi: Voice support')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/Rapptz/discord.py/archive/v${pkgver}.tar.gz")
sha512sums=('3a5b5fb678f312306aa6e3ec65df03e4b43252b0a4c1911042017e9d217eb1e053fa499c7f763735ffa0b2efbdc2cc91ff9bd5f5463689ce2ead110c855a1737')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	python setup.py build
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
