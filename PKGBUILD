# Maintainer: Marco Pompili <aur (at) emarcs (dot) org>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

_npmname=ungit
_npmver=1.1.29
pkgname=nodejs-ungit
pkgver=1.1.29
pkgrel=1
pkgdesc="Git made easy"
arch=('i686' 'x86_64')
depends=('nodejs')
makedepends=('npm')
url="https://www.npmjs.com/package/ungit"
license=('MIT')
provides=('nodejs-ungit' 'ungit')
conflicts=('ungit')
options=('!emptydirs' '!strip')
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/ungit/-/ungit-${pkgver}.tgz")
sha256sums=('fa15cdb478b5451dc537e315228cb2f8a5b284ad30c80384a01bca78cd3a2929')

package() {
  cd ${srcdir}
  local _npmdir="${pkgdir}/usr/lib/node_modules/"
  mkdir -p ${_npmdir}
  cd ${_npmdir}
  npm install -g --prefix "${pkgdir}/usr" ${_npmname}@${_npmver}

  msg2 'Renaming binary from 0ungit-credentials-helper to ungit-credentials-helper'
  mv "${pkgdir}/usr/bin/0ungit-credentials-helper" "${pkgdir}/usr/bin/ungit-credentials-helper"
}
