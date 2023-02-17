# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=cacert-csr
pkgver=0.1
pkgrel=3
pkgdesc='CAcert Certificate Signing Request Generator'
arch=('any')
url='https://wiki.cacert.org/CSRGenerator'
depends=('openssl')
license=('MIT')
source=("${pkgname}-${pkgver}::http://svn.cacert.org/CAcert/Software/CSRGenerator/csr"
        'san-ip.patch')
sha256sums=('4b17e7cb6bc53cc704f1c3877f5eb0fd7df0f639f930d2013f018a00eeca191f'
            '89ea5fe1ecfb12c55c3fc9a2f49c429f3df4cbe0778925eba56c87204740162c')

prepare() {
  ln -s ${pkgname}-${pkgver} csr
  patch -Np1 --follow-symlinks < san-ip.patch
}

package() {
  install -D -m0755 csr "${pkgdir}"/usr/bin/csr
}

