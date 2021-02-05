pkgname=python-discord-pretty-help
_name=${pkgname#python-}
pkgver=1.2.1
pkgrel=1
pkgdesc='And nicer looking interactive help menu for discord.py'
arch=('any')
url=https://github.com/stroupbslayen/discord-pretty-help
license=('MIT')
depends=('python-discord>=1.5.1' 'python')
makedepends=('python-pip')
_wheel="${_name//-/_}-${pkgver}-py3-none-any.whl"
sha256sums=('0ffde855b83152884a6bd2244e7d4500220e4f1fcfa93189394eead222126ac5')
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
noextract=("$_wheel")

package() {
	pip install --compile --no-deps --ignore-installed --root="$pkgdir" "$_wheel"
}
