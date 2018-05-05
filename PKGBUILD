# Maintainer: Dan Elkouby <streetwalrus@codewalr.us>
pkgname=python-telethon-aio-git
pkgver=20180428.d693535
pkgrel=1
pkgdesc="Pure Python 3 Telegram client library, asyncio version"
arch=('any')
url="https://github.com/LonamiWebs/Telethon/"
license=('MIT')
depends=('python>=3.5' 'python-pyaes' 'python-rsa')
makedepends=('python-setuptools')
conflicts=('python-telethon')
options=(!emptydirs)
source=("git+https://github.com/LonamiWebs/Telethon.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/Telethon"
  git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
  cd "$srcdir/Telethon"
  ./setup.py build
}

package() {
  cd "$srcdir/Telethon"
  ./setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.rst"
}

# vim:set ts=2 sw=2 et:
