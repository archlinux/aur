# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=cacert-csr
pkgver=0.1
pkgrel=4
pkgdesc='CAcert Certificate Signing Request Generator'
arch=('any')
url='https://wiki.cacert.org/CSRGenerator'
depends=('openssl')
license=('MIT')
source=("${pkgname}-${pkgver}::http://svn.cacert.org/CAcert/Software/CSRGenerator/csr"
        'san-ip.patch')
sha256sums=('4b17e7cb6bc53cc704f1c3877f5eb0fd7df0f639f930d2013f018a00eeca191f'
            'c96fc13f3184f6c8a0217643e9c1c5a2ab3231e63c47276aa1baa98edd72159a')

prepare() {
  ln -s ${pkgname}-${pkgver} csr
  patch -Np1 --follow-symlinks < san-ip.patch
}

package() {
  install -D -m0755 csr "${pkgdir}"/usr/bin/csr
}

