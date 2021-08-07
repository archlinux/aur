# Maintainer: Dolfies <jeyalfie47+aur@gmail.com>
pkgname=python-discord-self
_pkgname=discord.py-self
pkgver=1.9.1
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
sha512sums=('675d7cfb58fadf3215d9fee5b4497cd72c604b2ce9e7dda4d967c5c442941143427aa4e377087becacd25da7df0c7e188b68620ed770c966240ea2e4fca011f6')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	python setup.py build
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
