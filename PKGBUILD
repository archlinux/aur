# Maintainer: Tarn W. Burton <twburton@gmail.com>

pkgname=ocicl
pkgver=1.0.19
pkgrel=1
pkgdesc='OCI-based ASDF system distribution and management tool for Common Lisp'
arch=('x86_64')
url='https://github.com/ocicl/ocicl'
license=('MIT')
depends=('sbcl' 'oras')
makedepends=('sbcl')
provides=('ocicl')
options=('!strip')
source=("https://github.com/ocicl/ocicl/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('0ce34eb66bd1aa75d49afc7d02bf9e3e1a000c5e8c2a34ea575e3b53232ebb194e86813fbc1f96621570ff5e159528a01d2f4833a4bdc51585ed5f7936836e5d')

prepare() {
  cd "ocicl-${pkgver}"
  sed -i 's/ocicl-oras/oras/g' ocicl.lisp
}

build() {
  cd "ocicl-${pkgver}"
  make
}

package() {
  cd "ocicl-${pkgver}"
  install -Dm755 ocicl "${pkgdir}/usr/bin/ocicl"
}
