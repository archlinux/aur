# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Francois Garillot <francois[@]garillot.net>
# Contributor: György Balló <ballogy@freestart.hu>

pkgname=python-flickrapi
pkgver=2.4.0
pkgrel=3
pkgdesc="The official Python interface to the Flickr API"
arch=('any')
url="http://stuvel.eu/flickrapi"
license=('Python')
depends=('python-six' 'python-requests-oauthlib' 'python-requests-toolbelt')
makedepends=('python-docutils' 'python-setuptools')
checkdepends=('python-nose')
source=("https://pypi.io/packages/source/f/flickrapi/flickrapi-$pkgver.tar.gz")
sha512sums=('8c14a00850fa0d70d5f0f0e856425b09cd25746f8ed3aaf34f59e0f8e8567ebb814893ddc3c768500207ec1fd437179ccae24d39a167f116020d4cb97d4cce1d')

build() {
  cd flickrapi-$pkgver
  python setup.py build
}

check() {
  # Tests not shipped
  return

  cd flickrapi-$pkgver
  python runtests
}

package() {
  cd flickrapi-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
