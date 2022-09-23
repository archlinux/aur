# Maintainer: Marco Rubin <marco.rubin@protonmail.com>
# Contributor: Sam Whited <sam@samwhited.com>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Contributor: Maxime "pep" Buquet <archlinux@bouah.net>

_name=aioopenssl
pkgname=python-$_name
pkgver=0.6.0
pkgrel=1
pkgdesc='An asyncio Transport that uses PyOpenSSL instead of the built-in ssl module.'
arch=('any')
url='https://github.com/horazont/aioopenssl'
license=('Apache')
depends=('python' 'python-pyopenssl')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
b2sums=('4342ccb22560aa003f68f0eaae0e5f3ccd525199c909f3e3a13548ebf0aec66e0f48e59d31b71b6e74080791800dabb12b226ea000afc3223d39b151fcf34fb3')

build() {
  cd $_name-$pkgver
  python setup.py build
}

package() {
  cd $_name-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
