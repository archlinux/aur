# Maintainer: Pranay Kanwar <pranay.kanwar@gmail.com>
_pkgname=beanstalk-client
pkgname=$_pkgname-git
pkgver=r119.d012ba8
pkgrel=1
pkgdesc='C/C++ beanstalkd client that is blocking by default.'
arch=('x86_64')
url='https://github.com/deepfryed/beanstalk-client'
license=('MIT')
makedepends=('gcc' 'git')
provides=('beanstalk-client')
conflicts=('beanstalk-client')
source=("${pkgname}"::"git+https://github.com/deepfryed/beanstalk-client.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="$pkgdir/" install
}

