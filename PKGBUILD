# Maintainer: Dolfies <jeyalfie47+aur@gmail.com>
pkgname=python-discord-self
_pkgname=discord.py-self
pkgver=1.9.0
pkgrel=1
pkgdesc="A fork of the popular discord.py for self-bots"
arch=(any)
url="https://github.com/dolfies/discord.py-self"
license=('MIT')
depends=('python' 'python-aiohttp')
makedepends=('python-setuptools')
optdepends=('python-pynacl: Voice support'
            'libffi: Voice support')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/dolfies/discord.py-self/archive/v${pkgver}.tar.gz")
sha512sums=('d56c3fc89075df0f098eae4bcfe6023190888e5fd26f9059e1f7e203cfeb30ae9045fcd2d2e29c6230f879f16d53fdf06eb66f8a300feaa58dd1abfd8954018d')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	python setup.py build
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
