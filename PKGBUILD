pkgname=python-discord-argparse
_name=${pkgname#python-}
pkgver=1.0.1
pkgrel=1
pkgdesc='Arbitrarily ordered arguments for commands in discord.py'
arch=('any')
url=https://github.com/lukeciel/discord-argparse
license=('MIT')
depends=('python-discord>=1.0.0' 'python')
makedepends=('python-pip')
_wheel="${_name/-/_}-${pkgver}-py3-none-any.whl"
sha256sums=('0bc4dfd47cf0048dad40525a623abb979fee506bbe0513071d0d82663183f849')
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name/-/_}-$pkgver-py3-none-any.whl")
noextract=("$_wheel")

package() {
	pip install --compile --no-deps --ignore-installed --root="$pkgdir" "$_wheel"
}