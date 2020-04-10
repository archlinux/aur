# Maintainer: Sam Whited <sam@samwhited.com>
# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Maintainer: Maxime "pep" Buquet <archlinux@bouah.net>

pkgname=python-aioopenssl
_name=${pkgname#python-}
pkgver=0.5.1
pkgrel=1
pkgdesc='An asyncio Transport that uses PyOpenSSL instead of the built-in ssl module.'
arch=('any')
url='https://github.com/horazont/aioopenssl'
license=('Apache')
depends=('python'
         'python-pyopenssl')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('68ff306ad6436c6ece06b6b399d107ae1f506b14253a9b7a02ae3859e3b4716b')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
