# Maintainer: Sam Whited <sam@samwhited.com>
# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=python-aioopenssl
_name=${pkgname#python-}
pkgver=0.4.1
pkgrel=1
pkgdesc='An asyncio Transport that uses PyOpenSSL instead of the built-in ssl module.'
arch=('any')
url='https://github.com/horazont/aioopenssl'
license=('Apache')
depends=('python'
         'python-pyopenssl')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('eb3ebc064aa263de1794fac78470d14129f36851aaa1e3eb93fa37bcbbe128ec')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
