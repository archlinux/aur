# Maintainer: Haruue Icymoon <haruue@caoyue.com.cn>

pkgname=ct-submit
pkgver=1.1.2
pkgrel=1
pkgdesc='A program for submitting X.509 certificate chains to Certificate Transparency log servers.'
arch=('i686' 'x86_64')
url='https://github.com/grahamedgecombe/ct-submit'
provides=('ct-submit')
license=('ISC')
depends=()
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/grahamedgecombe/ct-submit/archive/v$pkgver.tar.gz")
md5sums=('e31f0c1db42045765ba196e58e58f8a2')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  go build
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname-$pkgver" "${pkgdir}"/usr/bin/$pkgname
}
