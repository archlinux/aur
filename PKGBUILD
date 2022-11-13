# Maintainer: éclairevoyant
# Contributor: xiretza <xiretza+aur@gmail.com>

pkgname=python-discord
pkgver=2.1.0
_tarname=discord.py-$pkgver
pkgrel=1
pkgdesc="An API wrapper for Discord written in Python"
arch=('any')
url="https://github.com/Rapptz/discord.py"
license=('MIT')
depends=('python-aiohttp>=3.7.4' 'python-aiohttp<4')
makedepends=('python-setuptools')
optdepends=('python-pynacl>=1.3.0: voice support'
			'libffi: voice support'
			'python-orjson>=3.5.4: speed support'
			'python-aiodns: speed support'
			'python-brotli: speed support'
			'python-cchardet=2.1.7: speed support'
			'python<3.10: speed support')
source=("$_tarname.tar.gz::https://github.com/Rapptz/discord.py/archive/v$pkgver.tar.gz")
sha512sums=('842eff70c209613516e7d43a26d260f0269a141e5351ce02aaca05fe67f3b63963f2a4de2f71de1760b9efbb00a1587f2a3c7a7b45af0ac1833a47a30288b76e')

build() {
	cd "$srcdir/$_tarname"
	python setup.py build
}

package() {
	cd "$srcdir/$_tarname"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
