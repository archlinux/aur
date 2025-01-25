# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs

_pkgname=Bashfuscator
pkgname=bashfuscator-git
pkgver=r7487348
pkgrel=1
pkgdesc='Fully configurable and extendable Bash obfuscation framework'
arch=('any')
url="https://github.com/$_pkgname/$_pkgname"
license=('MIT')
source=("git+$url.git")
sha256sums=('SKIP')
makedepends=('git' 'python-setuptools')
depends=('python' 'python-pyperclip' 'python-argcomplete')
provides=('bashfuscator')
conflicts=('bashfuscator')

pkgver() {
  cd $_pkgname
  echo "r$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  python setup.py build
}

package() {
  cd "$_pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: ts=2 sw=2 et:
