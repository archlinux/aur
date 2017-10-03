# Maintainer: xiretza <xiretza+aur@gmail.com>
pkgname=python-discord
pkgver="v0.16.12"
pkgrel=1
pkgdesc="An API wrapper for Discord written in Python"
arch=(any)
url="https://github.com/Rapptz/discord.py"
license=('MIT')
depends=('python' 'python-websockets' 'python-aiohttp')
optdepends=('python-pynacl: voice'
	    'libffi: voice')
makedepends=('git')
source=("${pkgname}-${pkgver}::git+${url}#tag=${pkgver}")
sha256sums=('SKIP')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
  python setup.py install --root="$pkgdir/" --optimize=1
}
