# Contributor: Eriner <M@tthamilton.com>

pkgname=python-prawoauth2
pkgver=0.3
pkgrel=2
pkgdesc='prawoauth2 is a helper library which makes writing Reddit bots/apps using OAuth2 super easy and simple.'
arch=(any)
url='https://github.com/avinassh/prawoauth2'
license=('MIT')
depends=('python-praw' 'python-tornado')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/p/prawoauth2/prawoauth2-${pkgver}.tar.gz")
md5sums=('d93d3a1ef16ac90e36f806123f38f0ff')

build() {
  cd "prawoauth2-${pkgver}"
  python setup.py build
}

package() {
  cd "prawoauth2-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
} 
