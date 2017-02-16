# Maintainer: John Jenkins <twodopeshaggy@gmail.com>

pkgname=python-tweepy-git
pkgver=0.1067.80015db
pkgrel=1
pkgdesc="A Python library for accessing the entire Twitter API"
arch=('any')
url="https://github.com/tweepy/tweepy"
license=('MIT')
conflicts=('python-tweepy')
provides=('python-tweepy')
depends=('python-pysocks' 'python-requests' 'python-requests-oauthlib' 'python-six')
makedepends=(
  'python-setuptools' 'python-pip' 'git'
  'python-requests' 'python-requests-oauthlib' 'python-six'
)
source=("${pkgname%}::git+https://github.com/tweepy/tweepy")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}"/${pkgname}
        echo "0.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
    }

package() { 
  cd "$srcdir/$pkgname"
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
